require 'test_data'

#Create first user
1.times do
  User.create!(
  name: "Brian",
  email: "briandelacruz@gmail.com",
  password: "password"
  )
end
brian = User.first

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
