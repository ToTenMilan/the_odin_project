# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nyc = Airport.create(code: "NYC")
sfa = Airport.create(code: "SFA")
lax = Airport.create(code: "LAX")
waw = Airport.create(code: "WAW")

flight1 = Flight.create(departure_airport_id: nyc.id, destination_airport_id: sfa.id, start: Time.now + 1.year, duration: 4.hours)
flight2 = Flight.create(departure_airport_id: sfa.id, destination_airport_id: lax.id, start: Time.now + 15.months, duration: 3.hours)
