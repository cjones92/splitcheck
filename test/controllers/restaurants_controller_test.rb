require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  setup do
    @restaurants = restaurants
    @restaurant = restaurants(:one)
    @comment = comments(:one)
     sign_in users(:one)
    @user = users(:one)
   
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
   
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant when logged in" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: "Dilbert, OH", name: "Wally's" } }
    end

    assert_redirected_to root_path
  end
  
  test "should not create restaurant when logged out" do
    sign_out @user
    assert_no_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { location: "Dilbert, OH", name: "Wally's" } }
    end

    assert_redirected_to new_user_session_path
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit when logged in" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end
  
  test "should not get edit when not logged in" do
  sign_out @user
    get edit_restaurant_url(@restaurant)
    assert_redirected_to new_user_session_path
  end

  test "should update restaurant when logged in" do
    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name } }
    assert_redirected_to root_path
  end
  
  test "should not update restaurant when not logged in" do
    sign_out @user
    patch restaurant_url(@restaurant), params: { restaurant: { location: @restaurant.location, name: @restaurant.name } }
    assert_redirected_to new_user_session_path
  end
  
  
  
  test "should perform search" do
    get restaurants_url, params: { search: "Atlanta" }
    
    assert_equal("There is 1 result.", flash[:notice])
    
    get restaurants_url, params: { search: "New" }
    
    assert_equal("There are 2 results.", flash[:notice])
    
    get restaurants_url, params: { search: "Flurben" }
    assert_equal("No restaurants match the search criteria.", flash[:notice])
  
  
  end

  
  
  test "should add vote for splitting" do
  
     get upvote_url(@restaurant, @user.id)
     get upvote_url(@restaurant, @user.id)
     @restaurant.reload
     assert_equal(2, @restaurant.votes.where(for_splitting: true).size)
     
  end
  
  test "should not add vote for splitting when not logged in" do
    sign_out @user  
    get upvote_url(@restaurant, @user.id)
    assert_response(401)
    
  end
  
  test "should not add vote for not splitting when not logged in" do
    sign_out @user  
    get downvote_url(@restaurant, @user.id)
    assert_response(401)
  
  end
  
  test "should add vote against splitting" do
  
     get downvote_url(@restaurant, @user.id)
     get downvote_url(@restaurant, @user.id)
     @restaurant.reload
     assert_equal(2, @restaurant.votes.where(for_splitting: false).size)
  
  end
  
  test "should get average for splitting" do
      get upvote_url(@restaurant)
      get upvote_url(@restaurant)
  
      get downvote_url(@restaurant)
      get downvote_url(@restaurant)
      
      @restaurant.reload
      assert_equal(50, @controller.get_average_votes_for_restaurant(@restaurant.id))
  
  end
  
  test "should create favorite for restaurant when logged in" do
       get restaurants_url
       get restaurant_url(@restaurant)
       get pick_path(@restaurant.id)
       assert_equal(1, @user.favorites.where(restaurant_id: @restaurant.id).size)
  
  end
  
  test "should not create favorite for restaurant when not logged in" do
       sign_out @user
       get restaurants_url
       get restaurant_url(@restaurant)
       get pick_path(@restaurant.id)
       assert_redirected_to new_user_session_path
  
  end
  
  test "should comment on restaurant multiple times when logged in" do
       get restaurants_url
       get restaurant_url(@restaurant)
       get commenting_path(@restaurant.id)
        assert_difference('@restaurant.comments.count') do
      post comments_url, params: { comment: { comment: @comment.comment, restaurant_id: @restaurant.id, user_id: @user.id } }
    end

       assert_redirected_to restaurant_url(@restaurant)
       get restaurant_url(@restaurant)
       get commenting_path(@restaurant.id)
       assert_difference('@restaurant.comments.count') do
      post comments_url, params: { comment: { comment: @comment.comment, restaurant_id: @restaurant.id, user_id: @user.id } }
    end
    assert_redirected_to restaurant_url(@restaurant)
  
  
  end
  
  test "should not comment on restaurant when not logged in" do
  
     get restaurants_url
     get restaurant_url(@restaurant)
     get commenting_path(@restaurant.id)
  
  end
  
  test "should not destroy restaurant and should be redirected to root when attempt is made" do
    assert_no_difference('Restaurant.count') do
      delete comment_url(@comment)
    end

    assert_redirected_to root_path
  end
  
  
end
