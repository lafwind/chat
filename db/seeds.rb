# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if (user = User.find_by(email: 'lafwind@gmail.com')) && (!user.has_role?("Admin"))
  user.update(role: "Admin")
end

unless (User.find_by(role: "Admin") || User.find_by(email: 'lafwind@gmail.com'))
  User.create!(name: 'lafwind', email: 'lafwind@gmail.com', password: '123456', password_confirmation: '123456', role: 'Admin')# .skip_confirmation!
end
