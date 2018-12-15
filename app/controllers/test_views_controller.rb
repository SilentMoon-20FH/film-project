class TestViewsController < ApplicationController
    
    layout 'test_views'
    
    def index
    end
    
    def about
        
    end
    
    def contact
    end
    
    def games
    end
    
    def home
        @gameId = 1
        render :layout => 'home'
    end
    
    def news
    end
    
    def single
        gameId = params[:gameId]
        
        #显示游戏信息
        @game = Game.find(gameId)
        
        #显示游戏标签
        @tagLists = Rgametag.where("game_id = ?",gameId) 
        
        #评论列表，按评论时间降序排列（最新的在最前）
        @commentLists = Comment.where("game_id=?",gameId).order('created_at desc')
        
        
        puts @gameDetail
    end
    
    def writecomment
        
        #获得参数
        gameId = params[:gameId]
        comment = params[:comment]  
        score = params[:score]
        if score==nil
            score=3
        end
        curUser = current_user
        
        puts '=== score:'+score
        puts '=== comment:'+comment
        puts '=== curUser:'+curUser.email
        
        #存入数据库
        db = Comment.new
        db.content = comment
        db.game_id = gameId
        db.user_id = curUser.id
        db.score = score
        db.save
        
        #更新game评分
        w1=0.5          #步长因子
        up_game=Game.find(gameId)
        m=Comment.where("user_id=?",curUser.id).count
        curUser_score_sum=0
        for curUser_comment in Comment.where("user_id=?",curUser.id)
            curUser_score_sum=curUser_score_sum-curUser_comment.score+db.score
        end
        n=Comment.where("game_id=?",gameId).count
        n=m*n
        up_game.score=w1*curUser_score_sum/n+up_game.score
        up_game.save
        #更新tags评分
        w2=0.5      #步长因子
        for up_tag_id in Rgametag.where("game_id=?",gameId)
            up_tag=Tag.find(up_tag_id.tag_id)
            n=0
            for search_game_id in Rgametag.where("tag_id=?",up_tag_id)
                n=Comment.where("game_id=?",search_game_id.game_id).count
            end
            n=m*n
            up_tag.score=w2*curUser_score_sum/n+up_tag.score
            up_tag.save
        end
        
        
        #跳转刷新single界面
        redirect_to :action => "single", :gameId => gameId
        
    end
    
    #个人主页
    def aboutme
    end
    
    #别人的主页
    def aboutother
    end
    
    #关注按钮的响应
    def followfunc
        #写入关系表
        meUserId= params[:meUserId]
        otherUserId=params[:otherUserId]
        followship=Followship.new
        followship.follower_id=meUserId
        followship.followed_id=otherUserId
        followship.save
        
        #修改关注数
        meUser=User.find(meUserId)
        if meUser.follownum==nil
            meUser.follownum=1
            meUser.save
        else
            meUser.follownum=meUser.follownum+1
            meUser.save
        end
        
        #修改对方被关注数
        otherUser=User.find(otherUserId)
        if otherUser.fannum==nil
            otherUser.fannum=1
            otherUser.save
        else
            otherUser.fannum=otherUser.fannum+1
            otherUser.save
        end
        
        redirect_to :action => "aboutother", :userId => otherUserId

    end
    
    #取消关注
    def unfollowfunc
        meUserId= params[:meUserId]
        otherUserId=params[:otherUserId]
        followship=Followship.where("follower_id=? and followed_id=?",meUserId,otherUserId)
        followship[0].destroy
        followship[0].save
        
        #修改关注数
        meUser=User.find(meUserId)
        meUser.follownum=meUser.follownum-1
        meUser.save
        
        #修改对方被关注数
        otherUser=User.find(otherUserId)
        otherUser.fannum=otherUser.fannum-1
        otherUser.save
        
        redirect_to :action => "aboutother", :userId => otherUserId        
    end
    
    #上传头像
    def uploadpic
        
        current_user.picture=params[:browsefile]
        current_user.save
        
        #send_data current_user.image, :type =>'image / png', :disposition =>'inline'
        redirect_to :action => "aboutme"
    end
    
    def showpic
        f=File.open(current_user.picture,"rb")
        send_data(f.read, :type =>"image/jpeg", :disposition =>"inline")
    end
    
    #删除评论
    def deletecomment
        commId=params[:id]
        comm=Comment.find(commId)
        comm.destroy
        comm.save
        redirect_to :action => "aboutme"
    end
    
end
