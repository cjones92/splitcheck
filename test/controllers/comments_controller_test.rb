require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers

  setup do
    @comment = comments(:one)
    @restaurants = restaurants
    @restaurant = restaurants(:one)
    sign_in users(:one)
    @user = users(:one)
  end

  test "should be redirected to root when attempt to get index" do
    get comments_url
    assert_redirected_to root_path
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create comment when logged in" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { comment: @comment.comment, restaurant_id: @restaurant.id, user_id: @user.id } }
    end

    assert_redirected_to restaurant_url(@restaurant)
  end
  
  test "should not create comment when not logged in" do
    sign_out @user
    assert_no_difference('Comment.count') do
      post comments_url, params: { comment: { comment: @comment.comment, restaurant_id: @restaurant.id, user_id: @user.id } }
    end

    assert_redirected_to new_user_session_path
  end

  test "should be redirected to root when try to show comment" do
    get comment_url(@comment)
    assert_redirected_to root_path
  end

  test "should be redirected to root when try to edit comment" do
    get edit_comment_url(@comment)
    assert_redirected_to root_path
  end

  test "should be redirected to root when try to update comment" do
    patch comment_url(@comment), params: { comment: { comment: @comment.comment, restaurant_id: @restaurant.id, user_id: @user.id } }
    assert_redirected_to root_path
  end

  test "should not destroy comment and should be redirected to root when attempt is made" do
    assert_no_difference('Comment.count') do
      delete comment_url(@comment)
    end

    assert_redirected_to root_path
  end
end
