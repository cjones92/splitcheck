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
    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
   
  end

  test "updating a Restaurant" do
    visit restaurants_url
    click_on "Edit", match: :first

    fill_in "Location", with: "New York"
    fill_in "Name", with: "Chile's"
    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    
  end
  
  test "voting for splitting" do
    visit restaurants_url
    click_on "View and Vote!", match: :first
    click_on "Vote for Splitting"
    assert_text "1"
    end
  
  test "voting for not splitting" do
    visit restaurants_url
    click_on "View and Vote!", match: :first
    click_on "Vote against Splitting"
    click_on "View and Vote!", match: :first
    click_on "Vote against Splitting"
    assert_text "2"
    end
end
