require 'rails_helper'

RSpec.describe "user can edit pet's information" do
  it "clicks edit link from pet's show page" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")

    pet_1 = shelter_1.pets.create(image: "https://c8.alamy.com/comp/S0B5EF/goofy-cat-S0B5EF.jpg", name: "Fay", description: "", age: 5, sex: "Male", adoption_status: true)

    visit "/pets/#{pet_1.id}"
    click_link "Edit Pet Profile"

    expect(current_path).to eq("/pets/#{pet_1.id}/edit")
    expect(page).to have_content("Edit #{pet_1.name}'s Profile")

    fill_in "Image", with: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg"
    fill_in "Name", with: "Faye"
    fill_in "Description", with: "Faye is a tiny ball of ferocity, a true cat, elegant, fiesty, but cuddly!"
    fill_in "Age", with: 3
    fill_in "Sex", with: "Female"

    click_on "Update Pet Profile"

    expect(current_path).to eq("/pets/#{pet_1.id}")
    expect(page).to have_css("img[src*='https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg']")
    expect(page).to have_content("Name: Faye")
    expect(page).to have_content("Description: Faye is a tiny ball of ferocity, a true cat, elegant, fiesty, but cuddly!")
    expect(page).to have_content("Age: 3")
    expect(page).to have_content("Sex: Female")

    expect(page).to_not have_css("img[src*='https://c8.alamy.com/comp/S0B5EF/goofy-cat-S0B5EF.jpg']")
    # expect(page).to_not have_content("Name: Fay")
    expect(page).to_not have_content("Age: 5")
    expect(page).to_not have_content("Sex: Male")
  end
end
