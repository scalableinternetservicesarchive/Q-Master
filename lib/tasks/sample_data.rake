namespace :db do
	desc "Fill database with sample data"

	task populate: :environment do
  User.create!(name: "zimu",
               email: "abc@abc.com",
               password: "foobar",
               password_confirmation: "foobar",
					admin: true)

  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name: name,
			 			email: email,
						password: password,
						password_confirmation: password)
	 end

	 ad = User.first
	 50.times do
		c = Faker::Lorem.sentence(6)
		ad.articles.create!(text: c)
	 end
	end
end
