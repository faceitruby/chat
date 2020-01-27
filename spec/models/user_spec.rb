require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Have fields' do
    %i[
      id created_at updated_at email encrypted_password reset_password_token
      remember_created_at reset_password_sent_at unconfirmed_email
      last_name first_name confirmation_token confirmed_at confirmation_sent_at
      provider uid token expires_at expires refresh_token avatar
    ].each do |field|
      it { is_expected.to have_db_column(field) }
    end
  end

  context 'validation' do
    %i[first_name
       last_name
       email
       password].each do |field|
      it { is_expected.to validate_presence_of(:"#{field}") }
    end
  end

  describe OmniAuth::AuthHash do
    subject { OmniAuth::AuthHash.new }
    it 'converts a supplied info key into an InfoHash object' do
      subject.info = {:first_name => 'First Name'}
      expect(subject)
      expect(subject.info).to be_kind_of(OmniAuth::AuthHash::InfoHash)
      expect(subject.info.first_name).to eq('First Name')
    end
  end

  describe '#valid?' do
    subject { OmniAuth::AuthHash.new({
                                         :provider => 'google_oauth2',
                                         :uid => '100202098348898436402',
                                         :info => {
                                             :first_name => 'First',
                                             :last_name => 'Last',
                                             :email => 'email'
                                         },
                                         :credentials => {
                                             :token => '1234567890',
                                             :refresh_token => 'qwertyuiop',
                                             :expires_at => '21321312',
                                             :expires => true
                                         }
                                     }) }
    let(:hash) { subject.to_hash }

    it 'is valid with the right parameters' do
      expect(subject).to be_valid
    end

    %i[uid provider info].each do |item|
      it "requires a #{item}" do
        subject[item] = nil
        expect(subject).not_to be_valid
      end
    end

    it 'is a plain old hash' do
      expect(hash.class).to eq(::Hash)
    end

    %i[uid provider info credentials].each do |item|
      it "has string key #{item}" do
        expect(hash.keys).to be_include("#{item}")
      end
    end
  end

  describe AvatarUploader do
    include CarrierWave::Test::Matchers

    let(:user) { User.new }
    let(:uploader) { AvatarUploader.new(user, :avatar) }

    before do
      AvatarUploader.enable_processing = true
      File.open("#{Rails.root}/app/assets/images/avatars/noavatar.png") { |f| uploader.store!(f) }
    end

    after do
      AvatarUploader.enable_processing = false
      uploader.remove!
    end

    context 'the small version' do
      it "scales down a landscape image to be exactly 150 by 150 pixels" do
        expect(uploader.small).to have_dimensions(150, 150)
      end
    end

    context 'the normal version' do
      it "scales down a landscape image to be exactly 300 by 300 pixels" do
        expect(uploader.normal).to have_dimensions(300, 300)
      end
    end

    it "has the correct format" do
      expect(uploader).to be_format('png')
    end
  end

  describe '#valid' do
    let!(:user) { create(:valid_user) }
    it "valid with valid attributes" do
      expect(user).to be_valid
    end
  end

  context 'Associations' do
    context 'has many' do
      %i[chat_members].each do |association|
        it { is_expected.to have_many(association) }
      end
    end
  end
end
