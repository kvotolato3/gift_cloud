# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Users..."
kathleen = User.create(email: "kathleen@example.com", password: "12345678", nickname: "Kathleen")
kelly = User.create(email: "kelly@example.com", password: "12345678", nickname: "Kelly")
katie = User.create(email: "katie@example.com", password: "12345678", nickname: "Katie")
ray = User.create(email: "ray@example.com", password: "12345678", nickname: "Ray")
vilmos = User.create(email: "vilmos@example.com", password: "12345678", nickname: "Vilmos")
rita = User.create(email: "rita@example.com", password: "12345678", nickname: "Rita")

puts "Creating occasions..."
votolato_xmas = Occasion.create(name: "Votolato Christmas 2016", date: DateTime.new(2016,12,25), creator_user_id: kathleen.id)
csizmadia_xmas = Occasion.create(name: "Csizmadia Christmas 2016", date: DateTime.new(2016,12,24), creator_user_id: kathleen.id)


puts "Adding users to occasions..."
votolato_xmas_users = [kathleen, kelly, katie, ray, vilmos]
votolato_xmas_users.each do |user|
  OccasionUser.create(user: user, occasion: votolato_xmas);
end

csizmadia_xmas_users = [vilmos, kathleen, rita]
csizmadia_xmas_users.each do |user|
  OccasionUser.create(user: user, occasion: csizmadia_xmas);
end

puts "Creating User Items..."
user_items = UserItem.create([
  {name: "Apple Macbook Pro 15-inch", claim_more_than_once: false, user: kathleen},
  {name: "The Wise Man's Fear", claim_more_than_once: false, user: kathleen},
  {name: "Gift Certificate - Nordstrom", claim_more_than_once: true, user: kathleen},
  {name: "DermOrganic Shampoo and Conditioner", claim_more_than_once: true, user: kathleen},
  {name: "A Creator's Guide to Transmedia Storytelling (Book)", claim_more_than_once: false, user: vilmos},
  {name: "Fellowes Powershred 79Ci Paper Shredder", claim_more_than_once: false, user: vilmos},
  {name: "Boss Monster 2: The Next Level (Card Game)", claim_more_than_once: false, user: vilmos},
  {name: "The Art of Spirited Away (Book)", claim_more_than_once: false, user: vilmos},
  {name: "Cash", claim_more_than_once: true, user: vilmos},
  {name: "Create & Barrel (Gift Card)", claim_more_than_once: true, user: katie},
  {name: "Fantastic Beasts and Where to Find Them (Book)", claim_more_than_once: false, user: katie},
  {name: "Table Runner", claim_more_than_once: false, user: katie},
  {name: "Shop-Vac", claim_more_than_once: false, user: katie},
  {name: "Victoria's Secret (Gift Card)", claim_more_than_once: true, user: kelly},
  {name: "Tile Mate and Slim", claim_more_than_once: false, user: kelly},
  {name: "Clark's (Gift Card)", claim_more_than_once: true, user: kelly},
  {name: "Hanabi (Card Game)", claim_more_than_once: false, user: kelly},
  {name: "On the Art of Singing (Book)", claim_more_than_once: false, user: ray},
  {name: "Pants", claim_more_than_once: true, user: ray},
  {name: "Return flight ticket", claim_more_than_once: false, user: ray},
  {name: "Conspirare - Unclouded Day (Tickets for May 20, 2017 at 8:00 p.m.)", claim_more_than_once: false, user: ray},
  {name: "Setting the Scene: The Art & Evolution of Animation Layout (Book)", claim_more_than_once: false, user: rita},
  {name: "'Whenever I Paint' artwork from the Cambridge Artists Cooperative", claim_more_than_once: false, user: rita},
  {name: "Dream Worlds: Production Design for Animation (Book)", claim_more_than_once: false, user: rita},
  {name: "Sketchbook: Composition Studies for Film (Book)", claim_more_than_once: false, user: rita}
  ])

puts "Creating Occasion User Items..."
user_items.each do |item|
  OccasionUser.where(user: item.user).each do |occasion_user|
    OccasionUserItem.create(occasion_id: occasion_user.occasion_id, user_item: item)
  end
end
