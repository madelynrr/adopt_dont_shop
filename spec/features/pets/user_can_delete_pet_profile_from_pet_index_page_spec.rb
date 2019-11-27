require 'rails_helper'

RSpec.describe "user can click on link to delete pet profile from pet index page" do
  it "deletes pet profile and redirects to pet index page" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "", age: 3, sex: "Female", adoption_status: "Available for Adoption")
    pet_2 = shelter_1.pets.create(image: "https://image.shutterstock.com/image-photo/cute-muzzle-black-cat-closeup-260nw-525137104.jpg", name: "Ed", description: "", age: 2, sex: "Male", adoption_status: "Available for Adoption")

    visit '/pets'

    click_link "Delete #{pet_1.name}'s Profile"

    expect(current_path).to eq('/pets')
    expect(page).to_not have_css("img[src*='https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg']")
    expect(page).to_not have_content("Name: Faye")
    expect(page).to_not have_content("Age: 3")
    expect(page).to_not have_content("Sex: Female")
  end
end
