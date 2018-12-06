class Tag < ApplicationRecord
    has_many :rgametags
    has_many :games, :through => :rgametags
end
