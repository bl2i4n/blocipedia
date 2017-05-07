require 'test_data'
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

#did this because faker gem wasn't installing
10.times do
  User.create!(
  name: UserData.user_name,
  email: UserData.user_email,
  password: "password"
  )
end

#Create Wikis
25.times do
  Wiki.create!(
  title: TestData.wiki_title,
  body: TestData.wiki_body,
  private: false,
  user: brian
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
