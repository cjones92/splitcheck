require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @comment = comments(:one)
  end
  
  test "visiting the index and being redirected to the root" do
    visit comments_url
    assert_selector "h1", text: "Restaurants"
  end
  
  test "visiting the edit page and getting redirected to the root" do
    visit edit_comment_path(@comment)
    assert_text "Restaurants"
  end
  
  test "visiting the show page and being redirected to the root" do
    visit comment_url(@comment)
    assert_selector "h1", text: "Restaurants"
  end
  
end
