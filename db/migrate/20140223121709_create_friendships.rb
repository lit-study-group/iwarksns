class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships, id: false do |t|
      t.belongs_to :user
      t.belongs_to :friend
    end
    add_index :friendships, :user_id
    add_index :friendships, [:user_id, :friend_id]
  end
end
