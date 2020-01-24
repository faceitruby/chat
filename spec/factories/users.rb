FactoryBot.define do
  factory :user do
    factory :valid_user do
      email { "agent0007@gmail.com" }
      password { 'password' }
      password_confirmation { 'password' }
      first_name { "James" }
      last_name { "Bond" }
      confirmed_at { Time.now }
      avatar { File.open("#{Rails.root}/app/assets/images/avatars/001-superhero.png") }
    end
  end
end
