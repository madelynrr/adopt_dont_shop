require 'rails_helper'

RSpec.describe "a user can click on a shelter name" do
  describe "takes user to that shelter's show page" do
    it "clicks shelter name in edit view" do
      shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

      visit "/shelters/#{shelter_1.id}/edit"

      click_link "Boulder Shelter"

      expect(current_path).to eq("/shelters/#{shelter_1.id}")
    end
  end
end
