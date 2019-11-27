require 'rails_helper'

RSpec.describe "user can click link by each shelter on index page" do
  it "deletes shelter" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    shelter_2 = Shelter.create(name: "Denver Shelter", address: "456 Regular Ave.", city: "Denver", state: "CO", zip: "80120")
    shelter_3 = Shelter.create(name: "Longmont Shelter", address: "456 Main St.", city: "Longmont", state: "CO", zip: "80110")

    pet = shelter_1.pets.create(image: "https://c8.alamy.com/comp/S0B5EF/goofy-cat-S0B5EF.jpg", name: "Fay", description: "", age: 5, sex: "Male", adoption_status: true)

    visit '/shelters'

    click_link "Delete Boulder Shelter"
    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("Boulder Shelter")
    expect(page).to have_content("Denver Shelter")
    expect(page).to have_content("Longmont Shelter")
  end
end
