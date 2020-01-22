class CreateChatRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_rooms do |t|
      t.boolean :chat_type
      t.string :title

      t.timestamps
    end
  end
end
