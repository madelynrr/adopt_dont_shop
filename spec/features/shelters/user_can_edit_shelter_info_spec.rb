require 'rails_helper'

RSpec.describe "as a user" do
  it "can edit a shelter's info" do

    littleton_shelter = Shelter.create(name: "Tempe Shelter", address: "123 Main St.", city: "Tempe", state: "AZ", zip: "85283")

    visit "/shelters/#{littleton_shelter.id}"
    click_link "Edit Shelter Information"

    expect(current_path).to eq("/shelters/#{littleton_shelter.id}/edit")

    fill_in "Name", with: "Littleton Shelter"
    fill_in "Address", with: "7619 S. Lamar Way"
    fill_in "City", with: "Littleton"
    fill_in "State", with: "CO"
    fill_in "Zip", with: "80128"

    click_on "Update Shelter"

    expect(current_path).to eq("/shelters/#{littleton_shelter.id}")
    expect(page).to have_content("Littleton Shelter")
    expect(page).to have_content("7619 S. Lamar Way")
    expect(page).to have_content("Littleton")
    expect(page).to have_content("CO")
    expect(page).to have_content("80128")

    expect(page).to_not have_content("Tempe Shelter")
    expect(page).to_not have_content("123 Main St.")
    expect(page).to_not have_content("Tempe")
    expect(page).to_not have_content("AZ")
    expect(page).to_not have_content("85283")
  end
end
