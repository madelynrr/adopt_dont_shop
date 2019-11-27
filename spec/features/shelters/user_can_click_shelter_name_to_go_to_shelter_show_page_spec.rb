require 'rails_helper'

RSpec.describe "a user can click on a shelter name" do
  describe "takes user to that shelter's show page" do
    it "clicks shelter name in edit view" do
      shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

      visit "/shelters/#{shelter_1.id}/edit"

      click_link "Boulder Shelter"
      expect(current_path).to eq("/shelters/#{shelter_1.id}")
    end

    it "clicks shelter name in index view" do
      shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

      visit '/shelters'

      click_link "Boulder Shelter"
      expect(current_path).to eq("/shelters/#{shelter_1.id}")
    end

    it "clicks shelter name in pet index page" do
      shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
      pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Bitty", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")

      visit "/shelters/#{shelter_1.id}/pets"

      click_link "Boulder Shelter"

      expect(current_path).to eq("/shelters/#{shelter_1.id}")
    end





  end
end
