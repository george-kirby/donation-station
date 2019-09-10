# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Interest.destroy_all
Donation.destroy_all
User.destroy_all
Location.destroy_all
Category.destroy_all

User.create(username: "geo", password: "p", phone_number: "123", email: nil)
User.create(username: "sohaib", password: "p", phone_number: "123", email: nil)
User.create(username: "oli", password: "p", phone_number: "123", email: nil)
User.create(username: "tegs", password: "p", phone_number: "123", email: nil)
User.create(username: "jg", password: "p", phone_number: "123", email: nil)
User.create(username: "chris", password: "p", phone_number: "123", email: nil)
User.create(username: "aude", password: "p", phone_number: "123", email: nil)
User.create(username: "erin", password: "p", phone_number: "123", email: nil)
User.create(username: "felipe", password: "p", phone_number: "123", email: nil)
User.create(username: "angie", password: "p", phone_number: "123", email: nil)
User.create(username: "will", password: "p", phone_number: "123", email: nil)
User.create(username: "polly", password: "p", phone_number: "123", email: nil)

categories = ["clothing, shoes and accessories", "electronics", "food", "furniture", "home & garden", "pet supplies", "sports & outdoors"]

categories.each {|category| Category.create(name: category)}

locations = ["Barking and Dagenham", "Barnet", "Bexley", "Brent", "Bromley", 
    "Camden", "City of London", "City of Westminster", "Croydon", "Ealing", 
    "Enfield", "Greenwich", "Hackney", "Hammersmith and Fulham", "Haringey", 
    "Harrow", "Havering", "Hillingdon", "Hounslow", "Islington", 
    "Kensington and Chelsea", "Kingston upon Thames", "Lambeth", 
    "Lewisham", "Merton", "Newham", "Redbridge", "Richmond upon Thames", 
    "Southwark", "Sutton", "Tower Hamlets", "Waltham Forest", "Wandsworth"] 

locations.each {|location| Location.create(name: location)}

Donation.create(title: "bike", description: "single-speed", category: Category.all[6], user: User.first, location: Location.all.sample)
Donation.create(title: "ps4", description: "fully working", category: Category.third, user: User.second, location: Location.all.sample)
Donation.create(title: "mugs", description: "a lovely pair of coffee mugs", category: Category.fifth, user: User.fourth, location: Location.all.sample)
Donation.create(title: "desk", description: "cool mahogany desk", category: Category.fourth, user: User.first, location: Location.all.sample)
Donation.create(title: "soup", description: "4 tins of soup", category: Category.third, user: User.third, location: Location.all.sample)
