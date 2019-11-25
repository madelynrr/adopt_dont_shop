require 'rails_helper'

RSpec.describe "user can visit shelter's pet index page" do
  describe "it clicks on link to add new adoptable pet" do
    describe "it goes to form to fill in image, name, description, age, sex" do
      it "creates new pet with adoption status available for adoption and redirects to shelter's pet index page" do
        shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

        visit "/shelters/#{shelter_1.id}/pets"

        click_link "Add a Pet"

        expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")
        expect(page).to have_content("Put a Pet up for Adoption")

        fill_in "Image", with: "http://static.ddmcdn.com/en-us/apl/breedselector/images/breed-selector/dogs/breeds/shiba-inu_01_lg.jpg"
        fill_in "Name", with: "Zhouc"
        fill_in "Description", with: "So much energy!!!"
        fill_in "Age", with: "5"
        fill_in "Sex", with: "Male"

        click_on "Create Pet Profile"

        expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
        expect(page).to have_css("img[src*='http://static.ddmcdn.com/en-us/apl/breedselector/images/breed-selector/dogs/breeds/shiba-inu_01_lg.jpg']")
        expect(page).to have_content("Name: Zhouc")
        expect(page).to have_content("Age: 5")
        expect(page).to have_content("Sex: Male")

        new_pet = Pet.last
        visit "/pets/#{new_pet.id}"
        expect(page).to have_content("Adoption Status: Adoptable!")
      end
    end
  end
end
