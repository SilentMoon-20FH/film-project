class DropRelationGameTags < ActiveRecord::Migration[5.1]
  def change
    drop_table :relation_game_tags
  end
end
