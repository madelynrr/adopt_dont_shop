require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "it can see all shelters listed" do
    shelter_1 = Shelter.create(name: "Boulder Shelter")

    shelter_2 = Shelter.create(name: "Denver Shelter")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)

    expect(page).to have_content(shelter_2.name)

  end
end
