class RelationGameTag < ApplicationRecord
  belongs_to :game
  belongs_to :tag
end
