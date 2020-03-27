require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "visiting the index" do
    visit restaurants_url
    assert_selector "h1", text: "Restaurants"
  end

  test "creating a Restaurant" do
    visit restaurants_url
    click_on "New Restaurant"

    fill_in "Location", with: "Chicago"
    fill_in "Name", with: "Applebee's"
    fill_in "Splitting average", with: @restaurant.splitting_average
    fill_in "Votes against splitting", with: @restaurant.votes_against_splitting
    fill_in "Votes for splitting", with: @restaurant.votes_for_splitting
    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
    click_on "Back"
  end

  test "updating a Restaurant" do
    visit restaurants_url
    click_on "Edit", match: :first

    fill_in "Location", with: "New York"
    fill_in "Name", with: "Chile's"
    fill_in "Splitting average", with: @restaurant.splitting_average
    fill_in "Votes against splitting", with: @restaurant.votes_against_splitting
    fill_in "Votes for splitting", with: @restaurant.votes_for_splitting
    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    click_on "Back"
  end

  test "destroying a Restaurant" do
    visit restaurants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Restaurant was successfully destroyed"
  end
end
