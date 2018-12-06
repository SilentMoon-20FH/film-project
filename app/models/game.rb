class Game < ApplicationRecord
    has_many :rgametags
    has_many :tags, :through => :rgametags
    
    has_many :comments
end
