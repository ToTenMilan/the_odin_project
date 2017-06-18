# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "gregor",
            email: "gregor@com.pl",
            password: "gregor",
            password_confirmation: "gregor",
            remember_digest: nil)

User.create(name: "archer",
            email: "archer@com.pl",
            password: "archer",
            password_confirmation: "archer",
            remember_digest: nil)

User.create(name: "john",
            email: "john@doe.pl",
            password: "johndoe",
            password_confirmation: "johndoe",
            remember_digest: nil)

3.times do |n|
  User.create(name: "user #{n}",
              email: "user#{n}@com.pl",
              password: "foobar",
              password_confirmation: "foobar",
              remember_digest: nil)
end
