require 'faker'

FactoryBot.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    factory :valid_user do
      email { "agent0007@gmail.com" }
      password { 'password' }
      password_confirmation { 'password' }
      first_name { "James" }
      last_name { "Bond" }
      confirmed_at { Time.now }
      avatar { File.open("#{Rails.root}/app/assets/images/avatars/001-superhero.png") }
<<<<<<< HEAD
      deleted_at { nil }
=======


>>>>>>> development
    end
    factory :random_user do
      email { generate :email }
      password { 'password' }
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      confirmed_at { Time.now }
      avatar { File.open("#{Rails.root}/app/assets/images/avatars/001-superhero.png") }
    end
  end
end
