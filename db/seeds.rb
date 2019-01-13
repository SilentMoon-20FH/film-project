# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

H = Hash["动作冒险" => 1, "动作" => 2,"冒险" => 3, "射击" => 4, "角色扮演" =>5, "格斗" => 6, "模拟" => 7, "策略" => 8]
C = Hash["动作冒险" => 0, "动作" => 0,"冒险" => 0, "射击" => 0, "角色扮演" =>0, "格斗" => 0, "模拟" => 0, "策略" => 0]
S = Hash["动作冒险" => 0, "动作" => 0,"冒险" => 0, "射击" => 0, "角色扮演" =>0, "格斗" => 0, "模拟" => 0, "策略" => 0]
gamecount = 1
#game
CSV.foreach('/home/ubuntu/workspace/film-project/db/gamelist.csv',headers:true) do |row| 
    Game.create(name:row[0],detail:row[4],score:row[2],pic:row[3])
    alltag = row[1].split(", ")
    for tg in alltag
        C[tg]+=1
        S[tg]+=row[2].to_f/2
    end
    gamecount+=1
end


Tag.create(name:"动作冒险",score:(S["动作冒险"]/C["动作冒险"]).round(1),pic:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547413241574&di=100e1d6827c586fcda9565d0e50cb190&imgtype=0&src=http%3A%2F%2Fi7.17173.itc.cn%2F2010%2Fnews%2F2010%2F12%2F20%2Fs1220buff01s.jpg")
Tag.create(name:"动作",score:(S["动作"]/C["动作"]).round(1),pic:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547413459565&di=a79edeabd5cfdb3678e83a875cad7954&imgtype=0&src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2Fcb854cd1aa1943beb365b900f4baffd320f112491b9c1-yGsdD2_fw236")
Tag.create(name:"冒险",score:(S["冒险"]/C["冒险"]).round(1),pic:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547413661104&di=3e810a08b061d7cbb2feb06f9ea3d87f&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2F6771ca526f501831df75e88cd1686ed01eac1a74.jpg")
Tag.create(name:"射击",score:(S["射击"]/C["射击"]).round(1),pic:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547413801916&di=b78b43ec4eb386e0e566a7af0c02e1e9&imgtype=0&src=http%3A%2F%2Fstatic.yingyonghui.com%2Fscreenshots%2F1432%2F1432195_9.jpg")
Tag.create(name:"角色扮演",score:(S["角色扮演"]/C["角色扮演"]).round(1),pic:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547413863620&di=8a341e724ff953e9278a9d9ca463bcde&imgtype=0&src=http%3A%2F%2Fimg.article.pchome.net%2Fgame%2F00%2F24%2F55%2F54%2Fpic_lib%2Fs960x639%2Ff608ca86de5538a1c392dcae698546c4s960x639.jpg")
Tag.create(name:"格斗",score:(S["格斗"]/C["格斗"]).round(1),pic:"http://t-1.tuzhan.com/f2e7cb37166d/c-1/l/2012/12/11/05/76d46fc60dfe48a286c752e7609da583.jpg")
Tag.create(name:"模拟",score:(S["模拟"]/C["模拟"]).round(1),pic:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547414308308&di=da3a2c0ddaf7aa5b9e09d918d3267dc4&imgtype=0&src=http%3A%2F%2Fimg.android.d.cn%2Fnew%2Fsmtpfbackend%2Fnew%2Fpageadv%2F201412%2F1419389926418P4Uv.jpg")
Tag.create(name:"策略",score:(S["策略"]/C["策略"]).round(1),pic:"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1547414002112&di=f44ab48a42a4e570a3920ef94903de0b&imgtype=0&src=http%3A%2F%2Fp1.so.qhimgs1.com%2Ft01d958065edb1d6531.jpg")

gamecount=1
CSV.foreach('/home/ubuntu/workspace/film-project/db/gamelist.csv',headers:true) do |row| 
    alltag = row[1].split(", ")
    for tg in alltag
        Rgametag.create(game_id:gamecount,tag_id:H[tg])
    end
    gamecount+=1
end
