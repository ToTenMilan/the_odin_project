# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gregor = User.create(name: "gregor")
gregor.created_events.create!(name: "house party", place: "my house", date: Time.now, description: "The most house party of house parties")
gregor.created_events.create!(name: "bubble bath party", place: "my bubble bath", date: 2.days.from_now, description: "Nothing extra ordinary, wine, caviar, troufles...")
gregor.created_events.create!(name: "sandbox party", place: "my sandbox", date: 1.month.from_now, description: "dont forget your toys (to not use mine again)")

balbina = User.create(name: "balbina")
balbina.created_events.create!(name: "balbinious party", place: "in my cave", date: 20.days.from_now, description: "The most balbinious party of balbinously")
balbina.created_events.create!(name: "less balbinious party", place: "in front of my cave", date: 15.days.from_now, description: "litlle less balbinious but must attend too")

giorgio = User.create(name: "giorgio")
giorgio.created_events.create!(name: "giorgious party", place: "in my giourgious castle", date: 1.year.from_now, description: "am giorgiest party from giorgio. You must Giorgio the Giorgio and don't forget to giorgio later. See ya")

random_guy = User.create(name: "random guy")

giorgious_party = giorgio.created_events.first.attendees.push([gregor, balbina, random_guy])

house_party = gregor.created_events.first.attendees.push([random_guy, balbina])

balbinious_party = balbina.created_events.first.attendees.push(gregor)

