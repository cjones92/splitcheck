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

    assert_redirected_to restaurants_url
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

  
  
  test "should add vote for splitting and update average" do
  
  get restaurants_url
  get restaurant_url(@restaurant)
  get upvote_url(@restaurant)
  get upvote_url(@restaurant)
  @restaurant.reload
  assert_equal(3, @restaurant.votes_for_splitting)
  assert_equal(75, @restaurant.splitting_average)
  
  end
  
  test "should add vote for not splitting and update average" do
  
  get restaurants_url
  get restaurant_url(@restaurant)
  get downvote_url(@restaurant)
  get downvote_url(@restaurant)
  @restaurant.reload
  assert_equal(3, @restaurant.votes_against_splitting)
  assert_equal(25, @restaurant.splitting_average)
  end
end
