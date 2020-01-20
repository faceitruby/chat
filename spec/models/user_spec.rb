require 'rails_helper'

RSpec.describe User, type: :model do
    context 'Have fields' do
      %i[
        id created_at updated_at email encrypted_password reset_password_token
        remember_created_at reset_password_sent_at unconfirmed_email
        last_name first_name confirmation_token confirmed_at confirmation_sent_at
      ].each do |field|
        it { is_expected.to have_db_column(field) }
      end
  end
end
