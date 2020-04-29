require "application_system_test_case"

class FavoritesTest < ApplicationSystemTestCase
  setup do
    @favorite = favorites(:one)
  end

  test "visiting the index" do
    visit favorites_url
    assert_selector "h1", text: "Favorites"
  end

 

  

  test "destroying a Favorite" do
    visit favorites_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorite was successfully destroyed"
  end
end
