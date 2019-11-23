require 'rails_helper'

RSpec.describe "shelter create page", type: :feature do
  describe "a user can visit shelters index page and click on link to create new shelter" do
    it "creates a new shelter" do

      visit '/shelters'

      click_link "Add a Shelter"

      expect(current_path).to eq('/shelters/new')

      fill_in "Name", with: "Littleton Shelter"
      fill_in "Address", with: "7619 S. Lamar Way"
      fill_in "City", with: "Littleton"
      fill_in "State", with: "CO"
      fill_in "Zip", with: "80128"

      click_on "Create Shelter"

      expect(current_path).to eq('/shelters')
      expect(page).to have_content("Littleton Shelter")
    end
  end
end
