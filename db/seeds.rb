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

User.create(username: "geo", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "sohaib", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "oli", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "tegs", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "jg", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "chris", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "aude", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "erin", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "felipe", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "angie", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "will", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
User.create(username: "polly", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)

categories = ["clothing, shoes and accessories", "electronics", "food", "furniture", "home & garden", "pet supplies", "sports & outdoors"]

categories.each {|category| Category.create(name: category)}

location_names = ["Central", "East", "North", "North-West","South-East", "South-West", "West"]

location_names.each {|location| Location.create(name: location)}

Donation.create(title: "bike", description: "single-speed", category: Category.all[6], user: User.first, location: Location.all.sample)
Donation.create(title: "ps4", description: "fully working", category: Category.third, user: User.second, location: Location.all.sample)
Donation.create(title: "mugs", description: "a lovely pair of coffee mugs", category: Category.fifth, user: User.fourth, location: Location.all.sample)
Donation.create(title: "desk", description: "cool mahogany desk", category: Category.fourth, user: User.first, location: Location.all.sample)
Donation.create(title: "soup", description: "4 tins of soup", category: Category.third, user: User.third, location: Location.all.sample)
