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

u = User.create(name: "Bin", email:"admin@gmail.com",
  password: "password123",
  is_admin: "true")

4.times do |i|
  name  = "User #{i+1}"
  email = "user#{i+1}@gmail.com"
  password = "password123"
  is_admin = "false"
  u = User.create!(name:  name,
               email: email,
               password: password,
               is_admin: is_admin)
end

User.all.each do |user|
  user.images.create
end

