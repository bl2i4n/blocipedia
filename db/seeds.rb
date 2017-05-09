include Faker
require 'user_data'

#Create first user
1.times do
  User.create!(
  name: "Brian",
  email: "briandelacruz@gmail.com",
  password: "password"
  )
end
brian = User.first

#Create users with faker
10.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end
users = User.all

#Create Wikis
25.times do
  Wiki.create!(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.paragraph
  )
end
wikis = Wiki.all

#Create private Wikis
25.times do
  Wiki.create!(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.paragraph,
  private: true,
  user: users.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
