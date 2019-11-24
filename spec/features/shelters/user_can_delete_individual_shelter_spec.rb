require 'rails_helper'

RSpec.describe "as a user" do
  it "can delete an individual shelter" do

    shelter = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

    visit "shelters/#{shelter.id}"

    click_link "Delete Shelter"

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content("Boulder Shelter")
  end
end
