require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurants = restaurants
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
      post restaurants_url, params: { restaurant: { location: "Dilbert, OH", name: "Wally's" } }
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
    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name } }
    assert_redirected_to restaurants_url
  end
  
  test "should perform search" do
    get restaurants_url, params: { search: "Atlanta" }
    
    assert_equal("There is 1 result", flash[:notice])
    
    get restaurants_url, params: { search: "New" }
    
    assert_equal("There are 2 results", flash[:notice])
    
    get restaurants_url, params: { search: "Flurben" }
    assert_equal("No restaurants match the search criteria.", flash[:notice])
  
  
  end

  
  
  test "should add vote for splitting and update average" do
  
  
  get upvote_url(@restaurant)
  get upvote_url(@restaurant)
  @restaurant.reload
  assert_equal(2, @restaurant.votes_for_splitting)
  assert_equal(100, @restaurant.splitting_average)
  
  end
  
  test "should add vote for not splitting and update average" do
  
  
  get upvote_url(@restaurant)
  get upvote_url(@restaurant)
  get downvote_url(@restaurant)
  get downvote_url(@restaurant)
  @restaurant.reload
  assert_equal(2, @restaurant.votes_against_splitting)
  assert_equal(50, @restaurant.splitting_average)
  end
end
