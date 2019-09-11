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

geo = User.create(username: "geo", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
sohaib = User.create(username: "sohaib", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
oli = User.create(username: "oli", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
tegs = User.create(username: "tegs", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
joaquin = User.create(username: "joaquin", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
chris = User.create(username: "chris", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
aude = User.create(username: "aude", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
erin = User.create(username: "erin", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
felipe = User.create(username: "felipe", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
angie = User.create(username: "angie", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
will = User.create(username: "will", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)
polly = User.create(username: "polly", password: "p", phone_number: "07" + 9.times.map{rand(10)}.join)

categories = ["clothing, shoes and accessories", "electronics", "food", "furniture", "home & garden", "sports & outdoors"]

categories.each {|category| Category.create(name: category)}

location_names = ["Central", "East", "North", "North-West","South-East", "South-West", "West"]

location_names.each {|location| Location.create(name: location)}

bike = Donation.create(title: "bike", description: "single-speed, red lights don't apply", category: Category.all[5], user: geo, location: Location.all[1])
mugs = Donation.create(title: "mugs", description: "A lovely pair of coffee mugs. Great for your 15th and 16th coffees of the day at Flatiron.", category: Category.fifth, user: tegs, location: Location.all[5])
bed = Donation.create(title: "bed", description: "A grand four-poster bed. Not needed for sleep anymore as I'm studying at Flatiron", category: Category.fourth, user: angie, location: Location.all[2])
desk = Donation.create(title: "desk", description: "Cool mahogany desk - careful though, you'll get stuck at it doing Rails labs", category: Category.fourth, user: geo, location: Location.all[1])
beans = Donation.create(title: "beans", description: "tin of Heinz beans. Sorry, BEANZ", category: Category.third, user: oli, location: Location.all[5])
trousers_with_holes = Donation.create(title: "old trousers", description: "so many holes", category: Category.first, user: aude, location: Location.all[3])
soup = Donation.create(title: "soup", description: "4 cans of chicken noodle soup. Rails provides me with all the nourishment I need now", category: Category.third, user: oli, location: Location.all[5])
ps4 = Donation.create(title: "ps4", description: "fully working", category: Category.second, user: sohaib, location: Location.all[4])
bench = Donation.create(title: "bench", description: "beautiful garden bench", category: Category.fifth, user: joaquin, location: Location.all[5])
trampoline = Donation.create(title: "trampoline", description: "bouncy", category: Category.all[4], user: erin, location: Location.all[0])
freezer = Donation.create(title: "freezer", description: "useful for storing the bodies", category: Category.all[4], user: polly, location: Location.all[4])

bike.picture.attach(io: File.open('/Users/flatiron/Downloads/bike.png'), filename: 'bike.png') 
ps4.picture.attach(io: File.open('/Users/flatiron/Downloads/ps4.jpeg'), filename: 'ps4.jpeg') 
mugs.picture.attach(io: File.open('/Users/flatiron/Downloads/mugs.jpg'), filename: 'mugs.jpg') 
desk.picture.attach(io: File.open('/Users/flatiron/Downloads/desk.jpg'), filename: 'desk.jpg') 
beans.picture.attach(io: File.open('/Users/flatiron/Downloads/beans.jpg'), filename: 'beans.jpg') 
freezer.picture.attach(io: File.open('/Users/flatiron/Downloads/freezer.jpg'), filename: 'freezer.jpg') 
trousers_with_holes.picture.attach(io: File.open('/Users/flatiron/Downloads/trousers_with_holes.jpg'), filename: 'trousers_with_holes.jpg') 
soup.picture.attach(io: File.open('/Users/flatiron/Downloads/soup.jpg'), filename: 'soup.jpg') 
bench.picture.attach(io: File.open('/Users/flatiron/Downloads/bench.jpeg'), filename: 'bench.jpeg') 
trampoline.picture.attach(io: File.open('/Users/flatiron/Downloads/trampoline.jpeg'), filename: 'trampoline.jpeg')
bed.picture.attach(io: File.open('/Users/flatiron/Downloads/bed.jpeg'), filename: 'bed.jpeg')

20.times do 
    interest = Interest.new(donation: Donation.all.sample)
    other_users = User.all.select{|user| user != interest.donation.user && !interest.donation.interests.map{|i|i.user}.include?(user)}
    interest.user = other_users.sample
    interest.save
end