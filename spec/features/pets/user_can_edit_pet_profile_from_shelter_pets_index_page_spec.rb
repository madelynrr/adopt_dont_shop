require 'rails_helper'

RSpec.describe "user can click link to edit pet information from shelter pet index page" do
  it "takes user to edit form" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Bitty", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")

    visit "/shelters/#{shelter_1.id}/pets"

    click_link "Edit #{pet_1.name}'s Profile"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
    expect(page).to have_content("Edit #{pet_1.name}'s Profile")

    fill_in "image", with: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg"
    fill_in "name", with: "Faye"
    fill_in "description", with: ""
    fill_in "age", with: "3"
    fill_in "sex", with: "Female"

    click_on "Update Pet Profile"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_content("Faye")
    expect(page).to_not have_content("Bitty")
  end
end
