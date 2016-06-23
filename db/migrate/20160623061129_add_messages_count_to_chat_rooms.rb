class AddMessagesCountToChatRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :chat_rooms, :messages_count, :integer
  end
end
