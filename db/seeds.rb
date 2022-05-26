# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Destroying data"
  Restaurant.destroy_all
puts "Starting seeds"

10.times do
  restaurant = Restaurant.create(name: Faker::Company.name, address: Faker::Address.city, phone_number: Faker::PhoneNumber.phone_number_with_country_code, category: Restaurant::CATEGORY.sample)
  5.times do
    Review.create(rating: Review::RATING.sample, content: Faker::Restaurant.review, restaurant: restaurant)
    puts "#{Review.count} reviews created for #{restaurant.name}"
  end
  puts restaurant.name
end
