require "application_system_test_case"

class VotesTest < ApplicationSystemTestCase
  setup do
    @vote = votes(:one)
  end

  test "visiting the index and getting redirected to restaurants index" do
    visit votes_url
    assert_text "Restaurants"
  end
  
  test "visiting the edit page and getting redirected to restaurants index" do
    visit edit_vote_path(@vote)
    assert_text "Restaurants"
  end
  
  test "visiting the show page and getting redirected to restaurants index" do
    visit vote_path(@vote)
    assert_text "Restaurants"
  end

 
end
