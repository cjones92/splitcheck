require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: "Dilbert, OH", name: "Wally's", splitting_average: @restaurant.splitting_average, votes_against_splitting: @restaurant.votes_against_splitting, votes_for_splitting: @restaurant.votes_for_splitting } }
    end

    assert_redirected_to restaurant_url(Restaurant.last)
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name, splitting_average: @restaurant.splitting_average, votes_against_splitting: @restaurant.votes_against_splitting, votes_for_splitting: @restaurant.votes_for_splitting } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end
  
  test "should add vote for splitting" do
  
  get restaurants_url
  get restaurant_url(@restaurant)
  get upvote_url(@restaurant)
  @restaurant.reload
  assert_equal(2, @restaurant.votes_for_splitting)
  
  end
end
