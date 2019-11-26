require 'rails_helper'

RSpec.describe "user can click on edit for each shelter in index" do
  xit "redirects to shelter edit page" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    shelter_2 = Shelter.create(name: "Denver Shelter", address: "456 Regular Ave.", city: "Denver", state: "CO", zip: "80120")
    shelter_3 = Shelter.create(name: "Longmont Shelter", address: "456 Main St.", city: "Longmont", state: "CO", zip: "80110")

    visit "/shelters"

    click_link "Edit Shelter"

    expect(current_path).to eq("/shelters/:shelter_id")

    expect(page).to have_content("Name: #{shelter.name}")
  end
end
