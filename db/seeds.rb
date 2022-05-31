# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
    username: poke,
    password: "Apolo1234",
    email: "#{poke}@gmail.com",
    role: "renter"
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
      console: ["PS4", "XBOX", "Gameboy", "SNES"].sample,
      user: User.find(counter),
      daily_rent: [10, 5, 8, 2, 12].sample,
      released_year: (1980..2022).to_a.sample,
      min_rent_period: (4..10).to_a.sample
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
# LEO's seed file - End <-
