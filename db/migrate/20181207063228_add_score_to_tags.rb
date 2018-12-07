class AddScoreToTags < ActiveRecord::Migration[5.1]
  def change
    add_column :tags, :score, :integer
  end
end
