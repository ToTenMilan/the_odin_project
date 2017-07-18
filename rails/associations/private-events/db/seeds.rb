# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: "gregor")
user.created_events.create!(name: "house party", place: "my house", date: Time.now)
user.created_events.create!(name: "bubble bath party", place: "my bubble bath", date: 2.days.from_now)
user.created_events.create!(name: "sandbox party", place: "my sandbox", date: 1.month.from_now)
