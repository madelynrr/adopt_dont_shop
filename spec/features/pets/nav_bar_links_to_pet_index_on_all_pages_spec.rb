require 'rails_helper'

RSpec.describe "user can use nav bar to navigate site" do
  it "has link to pet index" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")

    visit "/pets/#{pet_1.id}/edit"
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')

    visit '/pets'
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')

    visit "/shelters/#{shelter_1.id}/pets/new"
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')

    visit "/pets/#{pet_1.id}"
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')

    visit "/shelters/#{shelter_1.id}/edit"
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')

    visit '/shelters'
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')

    visit '/shelters/new'
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')

    visit "/shelters/#{shelter_1.id}/pets"
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')

    visit "/shelters/#{shelter_1.id}"
    click_link "All Pets Available for Adoption"
    expect(current_path).to eq('/pets')
  end
end
