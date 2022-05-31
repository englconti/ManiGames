# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database"

Game.destroy_all
User.destroy_all
Rent.destroy_all

puts 'Database Clean'

puts 'Creating sample: Users -> Games -> Rents '

10.times do
  User.create(
    username: %w[Ze Ale Leo Cela Ju Peu Dan Edu Mia Lala].sample,
    email: %w[Ze@lalala.com Ale@lalala.com Leo@lalala.com Cela@lalala.com Ju@lalala.com Peu@lalala.com Dan@lalala.com\n
              Edu@lalala.com Mia@lalala.com Lala@lalala.com].sample,
    password: (10_000_000...11_000_000).to_a.sample
  )
end

10.times do
  game = Game.new(
    user_id: User.all.sample.id,
    title: Faker::Game.title,
    genre: Faker::Game.genre,
    brand: %w[Nintendo Valve Rockstar EA Activision Blizzard Sony Ubisoft Sega BioWare Capcom].sample,
    console: Faker::Game.platform,
    released_year: (1980...2022).to_a.sample
  )
  game.save
  puts game.title
end

5.times do
  Rent.create(
    user_id: User.all.sample.id,
    game_id: Game.all.sample.id
  )
end

puts "Finished"
