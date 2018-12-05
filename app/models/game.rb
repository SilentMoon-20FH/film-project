class Game < ApplicationRecord
    has_many :relation_game_tags
    has_many :tags, :through => :relation_game_tags
    
    has_many :comments
end
