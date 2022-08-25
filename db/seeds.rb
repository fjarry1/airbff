# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require "open-uri"

puts "cleaning database"
Reservation.destroy_all
Specialty.destroy_all
User.destroy_all

puts "creating test@test.test and azerty login"

user_jebg = User.create!(email: "test@test.test",
             password: "azerty",
             first_name: "Jean-Eude",
             last_name: "BG",
             birthdate: DateTime.now - 25.years,
             description: "Verrat de viande à chien de crisse de maudit de saint-cimonaque de sacréfice de crucifix d'astie de cochonnerie de saint-sacrament de purée de sacristi d'estique d'étole",
             gender: "M",
             address: "32 rue lemercier, 75017, Paris")

file = URI.open("https://source.unsplash.com/random/?profile")
user_jebg.photos.attach(io: file, filename: "avatar0.png", content_type: "image/png")
file = URI.open("https://source.unsplash.com/random/?profile")
user_jebg.photos.attach(io: file, filename: "avatar2-0.png", content_type: "image/png")
file = URI.open("https://source.unsplash.com/random/?profile")
user_jebg.photos.attach(io: file, filename: "avatar2-0.png", content_type: "image/png")
file = URI.open("https://source.unsplash.com/random/?profile")
user_jebg.photos.attach(io: file, filename: "avatar2-0.png", content_type: "image/png")
file = URI.open("https://source.unsplash.com/random/?profile")
user_jebg.photos.attach(io: file, filename: "avatar2-0.png", content_type: "image/png")
user_jebg.save!
3.times do
  puts "adding specialty"
  specialty_JEBG = Specialty.create!(title: Faker::Hobby.activity,
                                details: Faker::Lorem.sentence(word_count: (20..50).to_a.sample),
                                price: (0..100).to_a.sample.to_i,
                                user: user_jebg,
                                localisation: user_jebg.address)
  specialty_JEBG.save!
end

puts "Fake it until you make it"

counter = 1
20.times do
  user_resa = User.all.sample
  puts "creating user n°#{counter}"
  user = User.create!(email: Faker::Internet.email,
               password: "abcdefg",
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               birthdate: DateTime.now - (19..90).to_a.sample.years,
               description: Faker::Lorem.sentence(word_count: (50..100).to_a.sample),
               gender: ["M","F","Other"].sample,
               address: "Paris #{counter}")
  (1..7).to_a.sample.times do
    puts "photo"
    file = URI.open("https://source.unsplash.com/random/?profile")
    user.photos.attach(io: file, filename: "avatar#{counter}.png", content_type: "image/png")
  end
  user.save!
  (0..5).to_a.sample.times do
    puts "adding specialty"
    specialty = Specialty.create!(title: Faker::Hobby.activity,
                                  details: Faker::Lorem.sentence(word_count: (20..50).to_a.sample),
                                  price: (0..100).to_a.sample.to_i,
                                  user: user,
                                  localisation: user.address)
    specialty.save!
    (0..1).to_a.sample.times do
      puts "creating reservations"
      reservation = Reservation.create!(date: DateTime.now + (1..30).to_a.sample.days,
                                      comment: Faker::Lorem.sentence(word_count: (10..20).to_a.sample),
                                      specialty: specialty,
                                      user: user_resa,
                                      is_accepted: [nil, true, false].sample)
      reservation.save!
    end
  end
  counter += 1
end

reservation = Reservation.create!(date: DateTime.now + (1..30).to_a.sample.days,
                                      comment: Faker::Lorem.sentence(word_count: (10..20).to_a.sample),
                                      specialty: user_jebg.specialties.first,
                                      user: User.last,
                                      is_accepted: [nil, true, false].sample)
reservation.save!

puts "Database ready"
