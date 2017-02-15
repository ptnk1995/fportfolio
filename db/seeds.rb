# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: "Website")
Category.create(name: "Mobile")
Category.create(name: "Embedded")
Category.create(name: "Game")
Category.create(name: "Multi Platform")

u = User.create(name: "Bin", email:"admin@gmail.com", user_name: "Admin",
  password: "password123",
  position: "PM",
  biography: "Rooms oh fully taken by worse do.
   Points afraid but may end law lasted.
  Was out laughter raptures returned outweigh.")

u.add_role :admin

4.times do |i|
  name  = "User #{i+1}"
  email = "user#{i+1}@gmail.com"
  user_name = "Username #{i+1}"
  password = "password123"
  position = "Developer"
  biography = "Rooms oh fully taken by worse do. Points afraid but may end law lasted.
  Was out laughter raptures returned outweigh."

  u = User.create!(name:  name,
               email: email,
               password: password,
               position: position,
               biography: biography,
               user_name: user_name)
end
