require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'Have fields' do
    %i[
      message created_at updated_at chat_member_id
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end

  context 'validation' do
    let!(:message) { create(:message) }

    it 'is valid with the right parameters' do
      expect(message).to be_valid
    end

    it 'is not valid without the right parameters' do
      message.message = nil
      expect(message).to_not be_valid
    end
  end

  context 'Associations' do
    context 'belongs to' do
      %i[chat_member].each do |association|
        it { is_expected.to belong_to(association) }
      end
    end
  end
end
