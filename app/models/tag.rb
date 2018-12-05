class Tag < ApplicationRecord
    has_many :relation_game_tags
    has_many :games, :through => :relation_game_tags
end
