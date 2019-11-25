# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
shelter_2 = Shelter.create(name: "Denver Shelter", address: "456 Regular Ave.", city: "Denver", state: "CO", zip: "80120")
shelter_3 = Shelter.create(name: "Longmont Shelter", address: "456 Main St.", city: "Longmont", state: "CO", zip: "80110")
shelter_4 = Shelter.create(name: "Lafayette Shelter", address: "123 Regular St.", city: "Boulder", state: "CO", zip: "80303")
shelter_5 = Shelter.create(name: "Englewood Shelter", address: "3075 W. Floyd Ave.", city: "Englewood", state: "CO", zip: "80110")

pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")
pet_2 = shelter_1.pets.create(image: "https://image.shutterstock.com/image-photo/cute-muzzle-black-cat-closeup-260nw-525137104.jpg", name: "Ed", description: "", age: 2, sex: "Male", adoption_status: "Available for Adoption")
pet_3 = shelter_2.pets.create(image: "http://fallinpets.com/wp-content/uploads/2017/12/tabby-cat-breed-800x445.jpg", name: "Sunny", description: "", age: 6, sex: "Female", adoption_status: "Available for Adoption")
