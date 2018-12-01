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

def generate_string(number)
	charset = Array('A'..'Z')+ Array('a'..'z')
	Array.new(number) { charset.sample }.join
end
user_list.each do |name, email, password, password_confirmation|
	User.create( name: name, email: email, password: password, password_confirmation: password_confirmation)
end

2000.times do
	pass= '123456'
	_name = generate_string(8)
	_email = generate_string(8)+'@ucsb.com'
	User.create( name: _name, email: _email, password: pass, password_confirmation: pass)
end

q_list = [
	"Why do I have to eat my vegetables?",
	"Why is that man acting so crazy?",
	"Why is it so cold?",
	"Why are all the people in Holland so tall?",
	"What are you pretending not to know? ",
	"Why don’t you do the things you know you should be doing?",
	"What are your values and are you being true to them?",
	"In what ways are you being perceived, that you’re not aware of?",
	"What don’t you know, that you don’t know?",
	"If you achieved all of your life’s goals how would you feel?",
	"What did I learn today? ",
	"If you weren’t scared what would you do? ",
	"If you were dying, would you worry about this?",
	"Should you be focused on today or tomorrow? ",
	"What do you want your life to be in 5 years?"
]

2000.times do
	uid = User.ids.shuffle.first
	qtitle = rand 0..14
	User.find(uid).questions.create( title: q_list[qtitle],content: q_list[qtitle])
end


a_list = [
	"All possibilities open up when we stop deceiving ourselves.",
	"Life isn’t about figuring out what to do.  The real challenge is (not so) simply doing the things we know we should be doing.",
	"Write down the 3 most important aspects of each of these areas: family, romantic relationships, friends, work, health, sex and spirituality.",
	"Perception is reality.  Make sure, for better or worse, you know what people really think of you. ",
	"It’s always the obstacles that we don’t even see coming that are the biggest challenges in life. ",
	"The desires of our ego are often in conflict with the emotions of our heart.",
	"he discipline of delayed gratification is one of the most powerful habits of successful individuals. But most actions we take are meant to elicit an emotion in the now.",
	"I try and ask myself these 3 questions at the end of each day.",
	"What would your 90-year-old self, looking back on your own life, advise you to do in the moment?",
	"We so easily lose perspective on what takes up our energy and focus.  We’re all dying.",
	"Savor the present but don’t forget your future.  Life is a balance of knowing when to enjoy the moment vs. when to plant seeds for tomorrow’s harvest.",
	"Don’t accept that things just are the way they are.  Question why something can’t be done.  And when you get pushback to these questions, reframe the negative answers with possibilities.",
	"he way to measure your worth may just be to give more than you take.  Asking what/who you made better each day is a simple litmus test we can all measure ourselves by.",
	" If you don’t know where you’re going, you’ll never get there – Lewis Carroll.  Write down 5-year goals.  They’re close enough to grasp for, yet far off enough to achieve almost anything.",
	"Consistent, incremental improvement is the secret to achieving the greatest of feats.",
]
500.times do |i|
	uid = User.ids.shuffle.first
	atitle = rand 0..14
	q = Question.find(Question.ids.shuffle.first)
	answer = q.articles.build(text: a_list[atitle], user_id: uid)
	answer.save
end

50.times do
	uid = User.ids.shuffle.first
	q = Question.first
	answer = q.articles.build(text: a_list[0], user_id: uid)
	answer.save
	20.times do
	  	uid = User.ids.shuffle.first
		c = answer.comments.create(body: a_list[0], user_id: uid)
		c.save
   end
end
