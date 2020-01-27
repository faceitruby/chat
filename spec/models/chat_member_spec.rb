require 'rails_helper'

RSpec.describe ChatMember, type: :model do
  context 'Have fields' do
    %i[
      user_id chat_room_id member_type created_at updated_at
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end

  context 'Associations' do
    context 'belongs to' do
      %i[chat_room user].each do |association|
        it { is_expected.to belong_to(association) }
      end
    end

    context 'has many' do
      %i[messages].each do |association|
        it { is_expected.to have_many(association) }
      end
    end
  end
end
