require 'rails_helper'

RSpec.describe "welcome page", type: :feature do
  it "can see welcome page on heroku" do

    visit "/"

    expect(page).to have_content("Hello World")

  end
end
