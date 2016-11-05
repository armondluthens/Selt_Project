# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.create(name: 'TestRestaurant', password: 'test', email: 'test', contact: 'tester@email.com', location: 'iowa city', description: 'yummy', invitationID: 1)
Restaurant.create(name: 'incompleteSignUpAccount', email: 'test', invitationID: 2)