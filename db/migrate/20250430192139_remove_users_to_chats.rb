class RemoveUsersToChats < ActiveRecord::Migration[8.0]
  def change
    remove_column :chats, :receiver_id
    remove_column :chats, :sender_id
  end
end
