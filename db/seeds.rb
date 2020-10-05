# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do |n|
  name = Faker::Name.unique.name
  email = Faker::Internet.email
  password = "password"
  User.create!(
    username: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end

User.limit(10).each do |user|
  post = user.posts.create(remote_images_urls: %w[https://picsum.photos/350/350/?random https://picsum.photos/350/350/?random], body: Faker::Hacker.say_something_smart)
end