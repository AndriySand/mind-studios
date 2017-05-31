# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

100.times do |i|
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password', last_sign_in_at: DateTime.now.ago(( i * 3 ).hours))
end

User.all.each do |user|
  10.times do |i|
    user.reviews.create(rate: rand(1..100), description: Faker::Lorem.paragraph(20), created_at: DateTime.now.ago(rand(3..15).days))
  end
end