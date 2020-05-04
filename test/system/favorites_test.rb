require "application_system_test_case"

class FavoritesTest < ApplicationSystemTestCase
  setup do
    @favorite = favorites(:one)
  end

  test "visiting the index and being redirected to the root" do
    visit favorites_url
    assert_selector "h1", text: "Restaurants"
  end
  
  test "visiting the edit page and getting redirected to the root" do
    visit edit_favorite_path(@favorite)
    assert_text "Restaurants"
  end
  
  test "visiting the show page and being redirected to the root" do
    visit favorite_url(@favorite)
    assert_selector "h1", text: "Restaurants"
  end

end
