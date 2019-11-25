require 'rails_helper'

RSpec.describe "user can visit pet show page" do
  it "can delete pet profile" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

    pet_1 = shelter_1.pets.create(image: "https://c8.alamy.com/comp/S0B5EF/goofy-cat-S0B5EF.jpg", name: "Fay", description: "", age: 5, sex: "Male", adoption_status: true)

    visit "/pets/#{pet_1.id}"

    click_link "Delete Pet Profile"

    expect(current_path).to eq('/pets')

    expect(page).to_not have_css("img[src*='https://c8.alamy.com/comp/S0B5EF/goofy-cat-S0B5EF.jpg']")
    expect(page).to_not have_content("Name: Fay")
    expect(page).to_not have_content("Age: 5")
    expect(page).to_not have_content("Sex: Male")
  end
end
