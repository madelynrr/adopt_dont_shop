require 'rails_helper'

RSpec.describe "as a user" do
  it "can delete an individual shelter" do

    shelter = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

    pet = shelter.pets.create(image: "https://c8.alamy.com/comp/S0B5EF/goofy-cat-S0B5EF.jpg", name: "Fay", description: "", age: 5, sex: "Male", adoption_status: true)

    visit "/shelters/#{shelter.id}"
    click_link "Delete Shelter"

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("Boulder Shelter")
  end
end
