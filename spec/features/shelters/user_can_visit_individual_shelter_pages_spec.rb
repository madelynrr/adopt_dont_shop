require 'rails_helper'

RSpec.describe "shelters view page", type: :feature do
  it "can display each shelter and their information" do
    shelter_1 = Shelter.create(id: 1,
                              name: "Longmont Shelter",
                                address: "123 Main St.",
                                city: "Longmont",
                                state:"CO",
                                zip: "80501")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)

    expect(page).to have_content(shelter_1.address)

    expect(page).to have_content(shelter_1.city)

    expect(page).to have_content(shelter_1.state)

    expect(page).to have_content(shelter_1.zip)
  end
end
