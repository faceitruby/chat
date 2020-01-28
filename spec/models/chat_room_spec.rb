require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  context 'Have fields' do
    %i[
      chat_type title created_at updated_at
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end

  context 'Associations' do
    context 'has many' do
      %i[chat_members messages].each do |association|
        it { is_expected.to have_many(association) }
      end
    end
  end
end
