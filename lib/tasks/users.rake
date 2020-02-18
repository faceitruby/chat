namespace :users do
  desc "deleting archived users after 3 month"
  task deleting: :environment do
    p 'Scanning DB...'
    User.where("deleted_at < ?", 3.month.ago).each do |user|
      p "Archived user #{user.name} was deleted"
      user.destroy
    end
    p "Scanning finished, #{Time.now}"
  end

  desc "creates fake users and confirms they"
  task creating: :environment do
    20.times do
      u = User.new(email: Faker::Internet.email,
                   first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   password: "password")
      u.save!
      u.confirm
      p "User #{u.name} was created and confirmed"
    end
  end
end
