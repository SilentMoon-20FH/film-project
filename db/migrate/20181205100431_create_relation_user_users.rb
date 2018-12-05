class CreateRelationUserUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :relation_user_users do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
