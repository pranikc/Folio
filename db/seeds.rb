# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Deleting old data"
Company.destroy_all
User.destroy_all
Recommendation.destroy_all
Watchlist.destroy_all

puts "Creating new data"

20.times do
  User.create(name: Faker::Name.name, age: rand(13..120))
end

user_names = User.all.map do |each_user|
  each_user.name
end

10.times do
  Company.create(name: Faker::Company.name, board_members: user_names.sample, year: rand(1920..2021), industry: Faker::Company.industry)
end

50.times do
  Recommendation.create(rating: rand(1..10), user_id: User.ids.sample, company_id: Company.ids.sample, comment: Faker::Company.bs)
end

30.times do
  Watchlist.create(company_id: Company.ids.sample, user_id: User.ids.sample)
end

puts "Done!"