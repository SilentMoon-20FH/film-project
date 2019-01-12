class AddAttritubeToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :pic, :string
  end
end
