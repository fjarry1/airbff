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

puts "creating Jean-Eude.BG@gmail.com and azerty login"
age = DateTime.now - 25.years
user_jebg = User.create!(email: "Jean-Eude.BG@gmail.com",
             password: "azerty",
             first_name: "Jean-Eude",
             last_name: "BG",
             birthdate: age,
             description: "Salut Biloute, moi c'est Jean-Eude BG, le BG de Paris 17. J'ai #{DateTime.now.year - age.year} ans. L'aprem c'est ricard devant Sardou. Dans la vie j'aime pas les débats: y'a pas à tortiller du cul pour chier droit.",
             gender: "M",
             address: "32 rue lemercier, 75017, Paris")

file = URI.open("https://source.unsplash.com/WNoLnJo7tS8")
user_jebg.photos.attach(io: file, filename: "avatar0.png", content_type: "image/png")
file = URI.open("https://source.unsplash.com/2LowviVHZ-E")
user_jebg.photos.attach(io: file, filename: "avatar2-0.png", content_type: "image/png")
file = URI.open("https://source.unsplash.com/lLdGG3ESoiI")
user_jebg.photos.attach(io: file, filename: "avatar3-0.png", content_type: "image/png")
file = URI.open("https://source.unsplash.com/5OyGRn_r9Y4")
user_jebg.photos.attach(io: file, filename: "avatar4-0.png", content_type: "image/png")
file = URI.open("https://source.unsplash.com/bodgc6H44FA")
user_jebg.photos.attach(io: file, filename: "avatar5-0.png", content_type: "image/png")
user_jebg.save!
puts "adding specialty"
specialty_JEBG_1 = Specialty.create!(title: 'Crossfit',
                                details: "Le sport c'est la vie. La vie c'est le ricard. Boire du ricard, c'est un sport",
                                price: 25,
                                category: "SPORT",
                                user: user_jebg,
                                localisation: user_jebg.address)
specialty_JEBG_1.save!
specialty_JEBG_2 = Specialty.create!(title: "Quelqu'un a dit Bière 🍺 ?",
                                details: 'Viens brasser ta bière avec moi biloute',
                                price: 36,
                                category: "ARTISANAT",
                                user: user_jebg,
                                localisation: user_jebg.address)
specialty_JEBG_2.save!

puts "Fake it until you make it"
puts "creating user n°1"
first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
age = DateTime.now - (19..90).to_a.sample.years
user = User.create!(email: "#{first_name}.#{last_name}@gmail.com",
              password: "azerty",
              first_name: first_name,
              last_name: last_name,
              birthdate: age,
              description: "Salut 👋, moi c'est #{first_name} #{last_name}, j'ai #{DateTime.now.year - age.year} ans et j'habite dans le marais à paris. Tequilla, Heineken, pas l'temps d'niaiser",
              gender: ["M","F","Other"].sample,
              address: "Saint-Paul, Paris")
(2..7).to_a.sample.times do
  puts "photo"
  file = URI.open("https://source.unsplash.com/random/?profile")
  user.photos.attach(io: file, filename: "avatar.png", content_type: "image/png")
end
user.save!
puts "adding specialty"
specialty = Specialty.create!(title: "Marriage",
                              details: "Vous n'avez pas de date pour le marriage de votre cousine ? Je peux au choix enflammer la piste de dance, ou débattre de la géopolitique du thon rouge en mer méridionale.",
                              price: 20,
                              category: "ACCOMPAGNANT",
                              user: user,
                              localisation: user.address)
specialty.save!
specialty = Specialty.create!(title: "Visite de Grand-Parents",
                              details: "J'adore les vieilles personnes, les histoires qu'ils ont vécues et ont à raconter. Je peux me faire passer pour votre amie ou petite-amie en option.",
                              price: 25,
                              category: "ACCOMPAGNANT",
                              user: user,
                              localisation: user.address)
specialty.save!
puts "creating reservations"
reservation = Reservation.create!(date: DateTime.now + (1..30).to_a.sample.days,
                                  comment: "Je vais rendre visite à ma grand-mère et elle adorerait me voir en couple.",
                                  specialty: specialty,
                                  user: user_jebg,
                                  status: ["En attente", "Accepté", "Refusé"].sample)
reservation.save!

Reservation.create!(date: DateTime.now + (1..30).to_a.sample.days,
                    comment: "Le houblon, c'est ma passion 🍻",
                    specialty: specialty_JEBG_2,
                    user: user,
                    status: "Refusé")

puts "creating user n°2"
first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
age = DateTime.now - (19..90).to_a.sample.years
user = User.create!(email: "#{first_name}.#{last_name}@gmail.com",
              password: "azerty",
              first_name: first_name,
              last_name: last_name,
              birthdate: age,
              description: "Salut 👋, moi c'est #{first_name} #{last_name}, j'ai #{DateTime.now.year - age.year} ans et j'habite dans le quartier latin. J'adore prendre des photos de moi à la golden hour.",
              gender: ["M","F","Other"].sample,
              address: "14 rue Lagrange, 75005 Paris")
(2..7).to_a.sample.times do
  puts "photo"
  file = URI.open("https://source.unsplash.com/random/?profile")
  user.photos.attach(io: file, filename: "avatar.png", content_type: "image/png")
end
user.save!
puts "adding specialty"
specialty = Specialty.create!(title: "Clown",
                              details: "Vos enfants m'adoreront !!",
                              price: 30,
                              category: "DIVERTISSEMENT",
                              user: user,
                              localisation: user.address)
specialty.save!
specialty = Specialty.create!(title: "Fitness coach",
                              details: "En manque d'un fitness buddy ? Ne cherche pas plus loin je suis là.",
                              price: 15,
                              category: "SPORT",
                              user: user,
                              localisation: user.address)
specialty.save!
puts "creating reservations"
reservation = Reservation.create!(date: DateTime.now + (1..30).to_a.sample.days,
                                  comment: "Besoin de motivation à la salle.",
                                  specialty: specialty,
                                  user: user_jebg,
                                  status: ["En attente", "Accepté", "Refusé"].sample)
reservation.save!

Reservation.create!(date: DateTime.now + (1..30).to_a.sample.days,
                    comment: "Le houblon, c'est ma passion 🍻",
                    specialty: specialty_JEBG_2,
                    user: user,
                    status: "Accepté")


puts "creating user n°3"
first_name = Faker::Name.first_name
last_name = Faker::Name.last_name
age = DateTime.now - (19..90).to_a.sample.years
user = User.create!(email: "#{first_name}.#{last_name}@gmail.com",
                    password: "azerty",
                    first_name: first_name,
                    last_name: last_name,
                    birthdate: age,
                    description: "Salut 👋, moi c'est #{first_name} #{last_name}, j'ai #{DateTime.now.year - age.year} ans et j'habite dans le 7ème. J'adore manger et les ateliers créatifs",
                    gender: ["M","F","Other"].sample,
                    address: "8 rue de l'exposition, 75007 Paris")
(2..7).to_a.sample.times do
  puts "photo"
  file = URI.open("https://source.unsplash.com/random/?profile")
  user.photos.attach(io: file, filename: "avatar.png", content_type: "image/png")
end
user.save!
puts "adding specialty"
specialty = Specialty.create!(title: "Pique-nique",
                              details: "Profitons du soleil en dégustant de délicieuses quiches",
                              price: 23,
                              category: "DIVERTISSEMENT",
                              user: user,
                              localisation: user.address)
specialty.save!
specialty = Specialty.create!(title: "Poterie",
                              details: "Ensemble d'assiettes en céramiques",
                              price: 15,
                              category: "ARTISANAT",
                              user: user,
                              localisation: user.address)
specialty.save!
puts "creating reservations"
reservation = Reservation.create!(date: DateTime.now + (1..30).to_a.sample.days,
                                  comment: "Mes assiettes IKEA ne me plaisent plus, je cherche un nouveau loisir créatif",
                                  specialty: specialty,
                                  user: user_jebg,
                                  status: ["En attente", "Accepté", "Refusé"].sample)
reservation.save!

Reservation.create!(date: DateTime.now + (1..30).to_a.sample.days,
                    comment: "J'ai toujours voulu me mettre au crosstraining !!!",
                    specialty: specialty_JEBG_1,
                    user: user,
                    status: "En attente")

counter = 4
address = ["16 villa Gaudelet, 75011 Paris",
           "174 quaie de Jemmapes, 75010 Paris",
           "12 rue Lagille, 75018 Paris",
           "3 rue rude, 75116 Paris",
           "17 rue Duban, 75016 Paris",
           "38 Rue Duranton, 75015 Paris",
           "18 rue du lunain, 75014 Paris",
           "61 Rue Baudricourt, 75013 Paris",
           "81 Rue de Billancourt, 92100 Boulogne-Billancourt",
           "152 avenue de Paris, 94300 Vincennes",
           "27 Rue Arago, 94400 Vitry-sur-Seine",
           "2-4 Rue de Viseu, 78160 Marly-le-Roi"]
12.times do
  puts "creating user n°#{counter}"
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  age = DateTime.now - (19..90).to_a.sample.years
  user = User.create!(email: "#{first_name}.#{last_name}@gmail.com",
                      password: "azerty",
                      first_name: first_name,
                      last_name: last_name,
                      birthdate: age,
                      description: "Salut 👋, moi c'est #{first_name} #{last_name}, j'ai #{DateTime.now.year - age.year} ans et j'habite dans Paris. Je suis très sociable. J'aime les chiens et les chats. J'ai un lapin, il adore les carottes.",
                      gender: ["M", "F", "Other"].sample,
                      address: address[counter - 4])
  (2..4).to_a.sample.times do
    puts "photo"
    file = URI.open("https://source.unsplash.com/random/?profile")
    user.photos.attach(io: file, filename: "avatar.png", content_type: "image/png")
  end
  counter += 1
end

puts "Database ready"
