require 'rails_helper'

RSpec.describe "user can visit pet index by shelter" do
  it "shows all pets with image, name, age, and sex available at that shelter" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    shelter_2 = Shelter.create(name: "Denver Shelter", address: "456 Regular Ave.", city: "Denver", state: "CO", zip: "80120")

    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")
    pet_2 = shelter_1.pets.create(image: "https://image.shutterstock.com/image-photo/cute-muzzle-black-cat-closeup-260nw-525137104.jpg", name: "Ed", description: "", age: 2, sex: "Male", adoption_status: "Available for Adoption")
    pet_3 = shelter_2.pets.create(image: "http://fallinpets.com/wp-content/uploads/2017/12/tabby-cat-breed-800x445.jpg", name: "Sunny", description: "", age: 6, sex: "Female", adoption_status: "Available for Adoption")

    visit "shelters/#{shelter_1.id}/pets"

    expect(page).to have_content("Boulder Shelter Pets")
    expect(page).to have_css("img[src*='https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg']")
    expect(page).to have_content("Name: Faye")
    expect(page).to have_content("Age: 3")
    expect(page).to have_content("Sex: Female")

    expect(page).to have_css("img[src*='https://image.shutterstock.com/image-photo/cute-muzzle-black-cat-closeup-260nw-525137104.jpg']")
    expect(page).to have_content("Name: Ed")
    expect(page).to have_content("Age: 2")
    expect(page).to have_content("Sex: Male")

    expect(page).to_not have_css("img[src*='http://fallinpets.com/wp-content/uploads/2017/12/tabby-cat-breed-800x445.jpg']")
    expect(page).to_not have_content("Name: Sunny")
    expect(page).to_not have_content("Age: 6")
  end
end
