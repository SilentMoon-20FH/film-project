class AddScoreToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :score, :integer
  end
end
