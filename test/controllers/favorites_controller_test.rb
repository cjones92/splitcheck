require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @favorite = favorites(:one)
    sign_in users(:one)
  end

  test "should be redirected to root when trying to access index" do
    get favorites_url
    assert_redirected_to root_path
  end

  test "should get new" do
    get new_favorite_url
    assert_response :success
  end


  test "should be redirected to root when trying to access show page" do
    get favorite_url(@favorite)
    assert_redirected_to root_path
  end

  test "should be redirected to root when trying to access edit page" do
    get edit_favorite_url(@favorite)
    assert_redirected_to root_path
  end

  

  test "should not destroy favorite and should be redirected to root when attempt is made" do
    assert_no_difference('Favorite.count') do
      delete favorite_url(@favorite)
    end

    assert_redirected_to root_path
  end
end
