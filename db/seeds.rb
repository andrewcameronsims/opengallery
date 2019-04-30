# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seeding'

User.destroy_all
Workshop.destroy_all
Piece.destroy_all

puts 'now seeding buyers'

5.times do
  u = User.new
  u.email = Faker::Internet.email
  u.password = 'password1234'
  u.password_confirmation = 'password1234'
  u.save!
end

puts 'now seeding artists and workshops'

puts 'now seeding pieces'

5.times do
  u = User.new
  u.email = Faker::Internet.email
  u.password = 'password1234'
  u.password_confirmation = 'password1234'
  u.save

  w = Workshop.new
  w.bio = Faker::Lorem.sentence
  w.bank_account = Faker::Bank.account_number
  w.auto_respond_msg = 'Thanks for your email. I will respond to you shortly.'
  w.user_id = u.id # User_id associated with workshop
  w.save

  2.times do
    p = Piece.new
    p.name = Faker::Ancient.god
    p.description = Faker::Lorem.sentence
    p.price = Faker::Commerce.price(range = 50..200.0, as_string = false)
    p.materials = Faker::Construction.material + ' and ' + Faker::Construction.material
    p.dimensions = Faker::Measurement.height + ' by ' + Faker::Measurement.height
    p.sold = [true, false].sample # method on arrays which chooses randomly
    p.user_id = User.ids[0..4].sample # get all user ids and then take first 5 and choose a random one
		p.workshop_id = w.id
		p.save
  end
end

puts 'Seeding over'
