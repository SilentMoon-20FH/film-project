class CreateGamePicture < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :pic, :string
  end
end
