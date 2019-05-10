# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Defining tags in advance which will get assigned later on (filtering functionality)

tags_array = ['Dutch', 'Portrait', 'Sculpture', 'Landscape', 'Contemporary']

piece_filenames = []
10.times do |index|
#   `curl -o piece_#{index}.jpg #{url}`
  piece_filenames << "piece_#{index}.jpg"
end

puts 'Now seeding...'

Piece.destroy_all
Workshop.destroy_all
User.destroy_all

puts 'Seeding buyers.'

5.times do
  u = User.new
  u.full_name = Faker::Name.name
  u.email = Faker::Internet.email
  u.password = 'password1234'
  u.password_confirmation = 'password1234'
  u.secret_question = 'What is 1 + 1?'
  u.encrypted_secret = 'da4b9237bacccdf19c0760cab7aec4a8359010b0'
  u.address = Faker::Address.full_address
  u.phone = Faker::PhoneNumber.phone_number
  u.admin = false
  u.artist = false
  u.tags = tags_array.sample(2)
  u.save
end

puts 'Seeding artists, workshops, and pieces.'

counter = 0

5.times do
  u = User.new
  u.full_name = Faker::Name.name
  u.email = "testuserapp6@gmail.com"
  u.password = 'password1234'
  u.password_confirmation = 'password1234'
  u.secret_question = 'What is 1 + 1?'
  u.encrypted_secret = 'da4b9237bacccdf19c0760cab7aec4a8359010b0'
  u.address = Faker::Address.full_address
  u.phone = Faker::PhoneNumber.phone_number
  u.admin = false
  u.artist = true
  u.tags = tags_array.sample(2)
  u.save

  w = Workshop.new
  w.bio = Faker::Lorem.sentence
  w.bank_account = Faker::Bank.account_number
  w.auto_respond_msg = 'Thanks for your interest in my work! I will be in touch with you within 24 hours.'
  w.user_id = u.id # User_id associated with workshop
  w.save

  2.times do
    p = Piece.new
    p.name = Faker::Ancient.god + ' at the ' + [Faker::TvShows::TwinPeaks.location, Faker::Games::Myst.age][rand(0..1)]
    p.description = Faker::Lorem.paragraph(10)
    p.price = Faker::Commerce.price(range = 50..200.0, as_string = false)
    p.materials = Faker::Construction.material + ' and ' + Faker::Construction.material
    p.dimensions = Faker::Measurement.height + ' by ' + Faker::Measurement.height
    p.sold = [true, false].sample # method on arrays which chooses randomly
    p.user_id = User.ids[0..4].sample if p.sold? # get all user ids and then take first 5 and choose a random one
    p.workshop_id = w.id
    p.uploaded_image.attach(io: File.open('./app/assets/images/' + piece_filenames[counter]), filename: piece_filenames[counter])
    p.tags = tags_array.shuffle[0..1]
    p.save

    counter += 1
  end
end

# Create followers

# puts 'Removing downloaded images...'
# `rm ./piece_*.jpg`
puts 'Seeding over.'
