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
]

user_list.each do |name, email, password, password_confirmation|
	User.create( name: name, email: email, password: password, password_confirmation: password_confirmation)
end


User.find(1).questions.create( title: "why there are so many programmers?", content: "I'm talking about the fact.")
User.find(2).questions.create( title: "why there are so many programmers?", content: "I'm talking about the fact.")
User.find(3).questions.create( title: "why there are so many programmers?", content: "I'm talking about the fact.")
User.find(4).questions.create( title: "why there are so many programmers?", content: "I'm talking about the fact.")
