# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

restaurants = [
    {name: 'TestRestaurant',    password: 'test', email: 'test@email.com', contact: 'tester@email.com', location: 'iowa city', description: 'yummy', session_token: SecureRandom.base64},
    
  ]
  
restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end

deals = [
  
  ]
deals.each do |deal|
  Deals.create!(deal)
end