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
CSV.foreach('/app/db/gamelist.csv',headers:true) do |row| 
    Game.create(name:row[0],detail:row[4],score:row[2],pic:row[3])
    alltag = row[1].split(", ")
    for tg in alltag
        C[tg]+=1
        S[tg]+=row[2].to_f/2

    end
    gamecount+=1
end



Tag.create(name:"动作冒险",score:(S["动作冒险"]/C["动作冒险"]).round(1),pic:"tag1.jpg")
Tag.create(name:"动作",score:(S["动作"]/C["动作"]).round(1),pic:"tag2.jpg")
Tag.create(name:"冒险",score:(S["冒险"]/C["冒险"]).round(1),pic:"tag3.jpg")
Tag.create(name:"射击",score:(S["射击"]/C["射击"]).round(1),pic:"tag4.jpg")
Tag.create(name:"角色扮演",score:(S["角色扮演"]/C["角色扮演"]).round(1),pic:"tag5.jpg")
Tag.create(name:"格斗",score:(S["格斗"]/C["格斗"]).round(1),pic:"tag6.jpg")
Tag.create(name:"模拟",score:(S["模拟"]/C["模拟"]).round(1),pic:"tag7.jpg")
Tag.create(name:"策略",score:(S["策略"]/C["策略"]).round(1),pic:"tag8.jpg")

gamecount=1
CSV.foreach('/app/db/gamelist.csv',headers:true) do |row| 
    alltag = row[1].split(", ")
    for tg in alltag
        Rgametag.create(game_id:gamecount,tag_id:H[tg])
    end
    gamecount+=1
end

