require 'rails_helper'

RSpec.describe "user can visit individual pet page" do
  it "displays pet image, name, description, age, sex, adoption status" do
    shelter_1 = Shelter.create(name: "Boulder Shelter", address: "123 Main St.", city: "Boulder", state: "CO", zip: "80303")
    shelter_2 = Shelter.create(name: "Denver Shelter", address: "456 Regular Ave.", city: "Denver", state: "CO", zip: "80120")

    pet_1 = shelter_1.pets.create(image: "https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg", name: "Faye", description: "Faye is a tiny ball of ferocity, a true cat, elegant, fiesty, but cuddly!", age: 3, sex: "Female", adoption_status: "Adoptable!")
    pet_2 = shelter_2.pets.create(image: "https://image.shutterstock.com/image-photo/cute-muzzle-black-cat-closeup-260nw-525137104.jpg", name: "Ed", description: "A sweet, anxious boy, 20+ pounds, runs like a raccoon.", age: 2, sex: "Male", adoption_status: "Pending Adoption")

    visit "pets/#{pet_1.id}"

    expect(page).to have_css("img[src*='https://www.thehappycatsite.com/wp-content/uploads/2017/05/grey4.jpg']")
    expect(page).to have_content("Name: Faye")
    expect(page).to have_content("Description: Faye is a tiny ball of ferocity, a true cat, elegant, fiesty, but cuddly!")
    expect(page).to have_content("Age: 3")
    expect(page).to have_content("Sex: Female")
    expect(page).to have_content("Adoption Status: Adoptable!")

    expect(page).to_not have_css("img[src*='https://image.shutterstock.com/image-photo/cute-muzzle-black-cat-closeup-260nw-525137104.jpg']")
    expect(page).to_not have_content("Name: Ed")
    expect(page).to_not have_content("Description: A sweet, anxious boy, 20+ pounds, runs like a raccoon.")
    expect(page).to_not have_content("Age: 2")
    expect(page).to_not have_content("Sex: Male")
    expect(page).to_not have_content("Adoption Status: Pending Adoption")
  end
end
