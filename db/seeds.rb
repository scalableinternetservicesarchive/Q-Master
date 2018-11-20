# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_list = [
	[ "zimu", "zimu@ucsb.com", "123456", "123456" ],
	[ "boyuan", "boyuan@ucsb.com", "123456", "123456" ],
	[ "shuyang", "shuyang@ucsb.com", "123456", "123456" ],
	[ "april", "april@ucsb.com", "123456", "123456" ],
	[ "Tom", "tom@test.com","123456","123456"],
	[ "Jerry", "jerry@test.com", "123456", "123456"],
	[ "Jacob", "jacob@test.com", "123456", "123456"]
]

user_list.each do |name, email, password, password_confirmation|
	User.create( name: name, email: email, password: password, password_confirmation: password_confirmation)
end


User.find(1).questions.create( title: "Recommended food in California, Santa Barbara", content: "I'm currently traveling around santa barbara with my friends. And I'm looking for some restaurants with really good food, any suggestions on that?")
User.find(2).questions.create( title: "I'm recently divorced", content: "I had a broken relationship with my ex-wife. We'r recently arguing over the custody right of our 3 children. What am i supposed to do so that i won't lose all 3 of them? ")
User.find(3).questions.create( title: "How do u judge The Great Gatsby", content: "I read about this book recenly and I really want to share some of my feelings about this book with other people who also have read it.")
User.find(4).questions.create( title: "why there are so many programmers?", content: "Everyone knows that more and more programmars are being trained and hired in IT industry every year. But what is the cause of this trend. Why more and more people choose to dedicate themselves into this industry?")

