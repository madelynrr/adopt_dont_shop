require 'rails_helper'

RSpec.describe "user can click on pet name to go to pet's show page" do
  it "clicks pet name in edit form" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")

    visit "/pets/#{pet_1.id}/edit"

    click_link "Faye"
    expect(current_path).to eq("/pets/#{pet_1.id}")
  end

  it "clicks pet name in pet index page" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")

    visit '/pets'

    click_link "Faye"
    expect(current_path).to eq("/pets/#{pet_1.id}")
  end

  it "clicks pet name in pet show page" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")

    visit "/pets/#{pet_1.id}"

    click_link "Faye"
    expect(current_path).to eq("/pets/#{pet_1.id}")
  end

  it "clicks pet name in shelter's pet index page" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")

    visit "/shelters/#{shelter_1.id}/pets"

    click_link "Faye"
    expect(current_path).to eq("/pets/#{pet_1.id}")
  end
end
