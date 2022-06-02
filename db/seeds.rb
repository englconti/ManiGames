# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rents_upgrade
# LEO's seed file - Start ->

require 'faker'
require 'date'

puts "Cleaning database"

Rent.destroy_all
Game.destroy_all
User.destroy_all

puts 'Database Clean'
puts 'Populating DB'
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
puts "Populating USERS"
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
3.times do
  poke = Faker::Games::Pokemon.name
  new_user = User.create(
    username: poke.downcase,
    password: "Apolo1234",
    email: "#{poke.downcase}@gmail.com",
    role: ["renter", "owner"].sample
  )
  puts "User #{new_user.id}: #{new_user.username}"
end
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

puts "Populating GAMES"
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
counter = 1
3.times do
  puts "User id:#{counter}, username: #{User.find(counter).username}"
  5.times do
    game = Game.create(
      title: Faker::Game.title,
      genre: Faker::Game.genre,
      console: ["PS4", "XBOX", "Gameboy", "SNES", "GBA", "PSONE", "PS2", "PS3", "Xbox One", "DreamCast"].sample,
      user: User.find(counter),
      daily_rent: [10, 5, 8, 2, 12].sample,
      released_year: (1980..2022).to_a.sample,
      min_rent_period: (4..10).to_a.sample,
      brand: ["Sony", "Nintendo", "SEGA", "CAPCOM"].sample,
      address: Faker::Address.city
    )
    puts "  Game: #{game.title} , added!"
  end
  puts "=-=-=-=-=-=-=-=-=-=-=-=-"
  counter += 1
end
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

puts "Populating RENTS"
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
counter = 1
3.times do
  3.times do
    rent = Rent.new(
      user: User.find(counter),
      game: Game.where('user_id != ?', counter).sample,
      start_date: DateTime.new(2022, 5, (1..15).to_a.sample),
      end_date: DateTime.new(2022, 6, (1..15).to_a.sample)
    )
    rent.price = (rent.end_date - rent.start_date).to_i * rent.game.daily_rent
    rent.save
    puts "rent id:#{rent.id}, Game: #{rent.game.title}, Owner: #{rent.game.user.username}, Renter: #{rent.user.username}, Price: #{rent.price}"
  end
  counter += 1
end
puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
puts "Finished"
# # LEO's seed file - End <-

# puts "Populating RENTS"
# puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
# counter = 1
# 3.times do
#   3.times do
#     rent = Rent.new(
#       user: User.find(counter),
#       game: Game.where('user_id != ?', counter).sample,
#       start_date: DateTime.new(2022, 5, (1..15).to_a.sample),
#       end_date: DateTime.new(2022, 6, (1..15).to_a.sample)
#     )
#     rent.price = (rent.end_date - rent.start_date).to_i * rent.game.daily_rent
#     rent.save
#     puts "rent id:#{rent.id}, Game: #{rent.game.title}, Owner: #{rent.game.user.username}, Renter: #{rent.user.username}, Price: #{rent.price}"
#   end
#   counter += 1
# end
# puts "-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
# puts "Finished"
# # LEO's seed file - END <-

# # require 'faker'

# puts "Cleaning database"

# Game.destroy_all
# User.destroy_all
# Rent.destroy_all

# puts 'Database Clean'

# puts 'Creating sample: Users -> Games -> Rents '

# 10.times do
#   User.create(
#     username: %w[Ze Ale Leo Cela Ju Peu Dan Edu Mia Lala].sample,
#     email: %w[Ze@lalala.com Ale@lalala.com Leo@lalala.com Cela@lalala.com Ju@lalala.com Peu@lalala.com Dan@lalala.com \n
#               Edu@lalala.com Mia@lalala.com Lala@lalala.com].sample,
#     password: (10_000_000...11_000_000).to_a.sample
#   )
# end

# 10.times do
#   game = Game.new(
#     user_id: User.all.sample.id,
#     title: Faker::Game.title,
#     genre: Faker::Game.genre,
#     brand: %w[Nintendo Valve Rockstar EA Activision Blizzard Sony Ubisoft Sega BioWare Capcom].sample,
#     console: Faker::Game.platform,
#     released_year: (1980...2022).to_a.sample
#   )
#   game.save
#   puts game.title
# end

# 5.times do
#   Rent.create(
#     user_id: User.all.sample.id,
#     game_id: Game.all.sample.id
#   )
# end

# puts "Finished"
