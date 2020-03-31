require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should find by name" do
  
  assert_equal([restaurants(:one)], Restaurant.search("Outback"))
  
  
  end
  
  test "should find by location" do
  
  assert_equal([restaurants(:one)], Restaurant.search("Atlanta"))
  
 assert_equal([restaurants(:three), restaurants(:two)], Restaurant.search("New"))
  end
  
  
end
