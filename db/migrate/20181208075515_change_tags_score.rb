class ChangeTagsScore < ActiveRecord::Migration[5.1]
  def change
    change_column :tags, :score, :float
  end
end
