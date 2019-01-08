class ChangeGameScore < ActiveRecord::Migration[5.1]
  def change
    change_column :games, :score, :float
  end
end
