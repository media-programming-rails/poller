# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
User.create(name: "Barne", password: "geheim", password_confirmation: "geheim")

Poll.delete_all
Number.delete_all
Token.delete_all 
n = 40
range = 8
poll = Poll.create(name: "Poll with all answers", participants: n, open:true, public_result: false, instant_result:true)
tokens = poll.participation_tokens.map{|t| t.participation_key}
tokens.map{|key |poll.numbers.create(hours: rand(range+1), participation_key: key)}

poll = Poll.create(name: "Poll with half the answers", participants: n, open:true, public_result: false, instant_result:true)
tokens = poll.participation_tokens.map{|t| t.participation_key}
tokens = tokens[0..n/2]
tokens.map{|key |poll.numbers.create(hours: rand(range+1), participation_key: key)}

poll = Poll.create(name: "Poll with no answers", participants: n, open:true, public_result: false, instant_result:true)
