class CreateRelationGameTags < ActiveRecord::Migration[5.1]
  def change
    create_table :relation_game_tags do |t|
      t.references :game, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
