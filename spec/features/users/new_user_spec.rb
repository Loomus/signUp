require 'rails_helper'

RSpec.describe "As a Visitor", type: :feature do
  it "I can create an account" do
    visit "/"

    expect(page).to have_link("Create")
    click_link "Create"
    expect(current_path).to eq(new_user_path)
    fill_in "User name", with: "AndrewJ"
    fill_in 'user[phone_number]', with: 6053717265

    click_button "Create"
    user = User.last
    expect(current_path).to eq("/profile")
    expect(page).to have_content(user.user_name)
    expect(page).to have_content("You have been registered and logged in!")
  end

  it "I will be denied for an invaild phone number using characters" do
    visit "/"

    expect(page).to have_link("Create")
    click_link "Create"
    expect(current_path).to eq(new_user_path)
    fill_in "User name", with: "TommyJ"
    fill_in 'user[phone_number]', with: "asdfasdf"

    click_button "Create"
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Username taken or Phone Number invalid, try again")
  end

  it "I will be denied for an invaild phone number using too few integers" do
    visit "/"

    expect(page).to have_link("Create")
    click_link "Create"
    expect(current_path).to eq(new_user_path)
    fill_in "User name", with: "TommyJ"
    fill_in 'user[phone_number]', with: 324

    click_button "Create"
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Username taken or Phone Number invalid, try again")
  end

  it "I will be denied for an invaild phone number using too many integers" do
    visit "/"

    expect(page).to have_link("Create")
    click_link "Create"
    expect(current_path).to eq(new_user_path)
    fill_in "User name", with: "TommyJ"
    fill_in 'user[phone_number]', with: 93836464738282323

    click_button "Create"
    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Username taken or Phone Number invalid, try again")
  end
end
