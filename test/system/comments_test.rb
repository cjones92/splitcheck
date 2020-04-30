require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @comment = comments(:one)
  end

  


  test "destroying a Comment" do
    visit comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment was successfully destroyed"
  end
end
