require "application_system_test_case"

class RestaurantsTest < ApplicationSystemTestCase

test "registering a user" do
    visit restaurants_url
    click_on "Sign Up"
    fill_in "Email", with: "sallyannalynn@gmail.com"
    fill_in "Password", with: "cheeses"
    fill_in "Password confirmation", with: "cheeses"
    click_on "Sign Up"
    
    assert_text "Welcome! You have signed up successfully."
   
  end
  
  
  test "signing out a user" do
  
    visit restaurants_url
    click_on "Sign Up"
    fill_in "Email", with: "sallyannalynnel@gmail.com"
    fill_in "Password", with: "cheeses"
    fill_in "Password confirmation", with: "cheeses"
    click_on "Sign Up"
    click_on "Sign Out"
    
    assert_text "Signed out successfully."
  
  end
  
  test "signing in a user" do
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
    
    assert_text "Signed in successfully."
  
  end
  
  test "viewing user summary page" do
  
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
    click_on "My Summary Page"
    assert_text "User Summary For sallyannalynnel@gmail.com"
  
  
  
  end
  
 

end
