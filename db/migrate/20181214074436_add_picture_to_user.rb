class AddPictureToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :picture, :binary
  end
end
