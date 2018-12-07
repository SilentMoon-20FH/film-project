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
        
        #跳转刷新single界面
        redirect_to :action => "single", :gameId => gameId
        
    end
    
end
