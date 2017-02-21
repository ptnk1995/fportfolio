=begin# This file should contain all the record creation needed to seed the database with its default values.
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

Technique.create(skill: "Ruby on Rails")
Technique.create(skill: "PHP")
Technique.create(skill: "Java")
Technique.create(skill: "Android")
Technique.create(skill: "Pythod")
Technique.create(skill: "Javascript")
Technique.create(skill: "GitHub")
Technique.create(skill: "Design Pattern")
Technique.create(skill: "SQL")
Technique.create(skill: "Design")
Technique.create(skill: "IOS")
Technique.create(skill: "Unity")
Technique.create(skill: ".Net")

Certification.create(description: "For though result and talent add are parish valley.",
  name: "Agile")
Certification.create(description: "Cisco Certified Network Associate",
  name: "CCNA")
Certification.create(description: "Certified Information Systems Security Professional",
  name: "CISSP")
Certification.create(description: "Microsoft Certified Systems Engineer ",
  name: "MCSE")
Certification.create(description: "FTimed voice share led his widen noisy young",
  name: "CompTIA A+")

u = User.create(name: "Ky Huu Hai", email:"admin@gmail.com", user_name: "Admin",
  password: "password123", position: "PM",
  biography: "Rooms oh fully taken by worse do.Points afraid but may end law lasted.
   Was out laughter raptures returned outweigh.", phone: "01212129827")

u.add_role :admin

5.times do |e|
  TargetTechnique.create!(target_id: u.id, target_type: "User", technique_id: "#{e+1}")
  u.certificate_users.create!(user_id: u.id, certification_id: "#{e+1}")
end

30.times do |i|
  name  = "member #{i+1}"
  email = "user#{i+1}@gmail.com"
  user_name = "Username #{i+1}"
  password = "password123"
  position = "Developer"
  biography = "Rooms oh fully taken by worse do. Points afraid but may end law lasted.
  Was out laughter raptures returned outweigh."
  phone = "01212129827"

  u = User.create!(name:  name, email: email, password: password, position: position,
    biography: biography, user_name: user_name, phone: phone)

  5.times do |e|
    TargetTechnique.create!(target_id: u.id, target_type: "User", technique_id: "#{e+1}")
    u.certificate_users.create!(user_id: u.id, certification_id: "#{e+1}")
  end
end
=end

Project.new(name: "WSM", description: "Managing timesheet, leave,... in a working space", core_features: "Ruby", pm_url: "http://wsm.framgia.vn", is_suggest: true)
