class AddAttritubeToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pic, :string
    add_column :users, :information, :text
  end
end
