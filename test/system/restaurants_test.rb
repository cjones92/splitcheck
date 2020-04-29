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
    click_on "Sign Up"
    fill_in "Email", with: "sallyannalynn@gmail.com"
    fill_in "Password", with: "cheeses"
    fill_in "Password confirmation", with: "cheeses"
    click_on "Sign Up"
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "sallyannalynn@gmail.com"
    fill_in "Password", with: "cheeses"
    click_on "Log in"
    
    click_on "New Restaurant"

    fill_in "Location", with: "Chicago"
    fill_in "Name", with: "Applebee's"
    click_on "Create Restaurant"

    assert_text "Restaurant was successfully created"
   
  end

  test "updating a Restaurant" do
    visit restaurants_url
    click_on "Sign Up"
    fill_in "Email", with: "sallyannalynnel@gmail.com"
    fill_in "Password", with: "cheeses"
    fill_in "Password confirmation", with: "cheeses"
    click_on "Sign Up"
    click_on "Sign Out"
    click_on "Sign In"
    fill_in "Email", with: "sallyannalynnel@gmail.com"
    fill_in "Password", with: "cheeses"
    click_on "Log in"
    click_on "Edit", match: :first

    fill_in "Location", with: "New York"
    fill_in "Name", with: "Chile's"
    click_on "Update Restaurant"

    assert_text "Restaurant was successfully updated"
    
  end
  
  test "voting for splitting" do
    visit restaurants_url
    click_on "Sign Up"
    fill_in "Email", with: "sallyannalynn@gmail.com"
    fill_in "Password", with: "cheeses"
    fill_in "Password confirmation", with: "cheeses"
    click_on "Sign Up"
    click_on "View and Vote!", match: :first
    click_on "Vote for Splitting"
    assert_text "1"
    end
  
  test "voting for not splitting" do
  
    visit restaurants_url
    click_on "Sign Up"
    fill_in "Email", with: "annabanana@gmail.com"
    fill_in "Password", with: "cheeses"
    fill_in "Password confirmation", with: "cheeses"
    click_on "Sign Up"
    click_on "View and Vote!", match: :first
    click_on "Vote against Splitting"
    click_on "View and Vote!", match: :first
    click_on "Vote against Splitting"
    assert_text "2"
    end
  
  test "searching for restaurant" do
    visit restaurants_url
    fill_in :search, with: "Flurben"
    click_on "Search"
    assert_text "No restaurants match the search criteria"
    fill_in :search, with: "Atlanta"
    click_on "Search"
    assert_text "Outback"
  
  end
  
  test "favoriting a restaurant" do
   
  
    visit restaurants_url
    click_on "Sign Up"
    fill_in "Email", with: "annabanana@gmail.com"
    fill_in "Password", with: "cheeses"
    fill_in "Password confirmation", with: "cheeses"
    click_on "Sign Up"
    click_on "View and Vote!", match: :first
    click_on "Favorite This Restaurant"
    assert_text "You have favorited this restaurant"
    
  
  end
  
  test "commenting on a restaurant" do
    visit restaurants_url
    click_on "Sign Up"
    fill_in "Email", with: "annabanana@gmail.com"
    fill_in "Password", with: "cheeses"
    fill_in "Password confirmation", with: "cheeses"
    click_on "Sign Up"
    click_on "View and Vote!", match: :first
    click_on "Comment On Restaurant"
    fill_in "Comment", with: "This restaurant allows check splitting."
    click_on "Create Comment"
    assert_text "Comment was successfully created."
  
  
  end
   
end
