require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @vote = votes(:one)
    @restaurant = restaurants(:one)
    sign_in users(:one)
    @user = users(:one)
  end

  test "should get index" do
    get votes_url
    assert_response :success
  end

  test "should get new" do
    get new_vote_url
    assert_response :success
  end

  test "should create vote when logged in" do
    assert_difference('Vote.count') do
      post votes_url, params: { vote: { for_splitting: true, restaurant_id: @restaurant.id, user_id:@user.id } }
    end

    assert_redirected_to restaurants_url
  end
  
  test "should not create vote when user not logged in" do
    sign_out @user
    assert_no_difference('Vote.count') do
    
      post votes_url, params: { vote: { for_splitting: true, restaurant_id: @restaurant.id, user_id:@user.id } }
    end

    assert_redirected_to new_user_session_path
    end

  test "should show vote" do
    get vote_url(@vote)
    assert_response :success
  end

  test "should get edit" do
    get edit_vote_url(@vote)
    assert_response :success
  end

  test "should update vote" do
    patch vote_url(@vote), params: { vote: { for_splitting: @vote.for_splitting } }
   assert_response :success
  end

  test "should destroy vote" do
    assert_difference('Vote.count', -1) do
      delete vote_url(@vote)
    end

    assert_redirected_to votes_url
  end
end
