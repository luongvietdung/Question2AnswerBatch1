# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "exampleuser",
             email: "example@railstutorial.org",
             password:    "123456",
             fullname: "Nguyen Thi Anh Duong" 
            )

users = User.order(:created_at).take(6)
50.times do |n|
  title =  "Rails tutorial"
  content = Faker::Lorem.sentence(5)
  view = n + 1
  users.each { |user| user.questions.create!(title: title, content: content, view: view) }
end
