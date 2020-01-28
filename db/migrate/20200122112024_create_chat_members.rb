class CreateChatMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat_room, null: false, foreign_key: true
      t.string :member_type

      t.timestamps
    end
  end
end
