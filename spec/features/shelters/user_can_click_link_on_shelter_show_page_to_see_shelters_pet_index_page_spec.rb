require 'rails_helper'

RSpec.describe "user can visit shelter's pet index page" do
  it "clicks link on shelter show page" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

    visit "/shelters/#{shelter_1.id}"
    click_link "All Pets Available at #{shelter_1.name}"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
  end
end
