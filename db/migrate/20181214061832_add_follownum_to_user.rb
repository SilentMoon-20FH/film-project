class AddFollownumToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :follownum, :integer
  end
end
