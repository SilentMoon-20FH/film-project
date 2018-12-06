class DropRelationUserUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :relation_user_users
  end
end
