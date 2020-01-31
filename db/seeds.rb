# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

chats = { public: FactoryBot.create(:chat_room),
          private: FactoryBot.create(:chat_room, :private)}

chats.each do |_key, chat|
  user = FactoryBot.create(:random_user)
  FactoryBot.create(:member_owner, user: user, chat_room: chat)
  3.times do
    user = FactoryBot.create(:random_user)
    FactoryBot.create(:member_moderator, user: user, chat_room: chat)
  end
  5.times do
    user = FactoryBot.create(:random_user)
    FactoryBot.create(:member_member, user: user, chat_room: chat)
  end
end
