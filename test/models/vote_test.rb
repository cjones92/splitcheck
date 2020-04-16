require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  
  
  test "should find number of yes votes" do
  
   assert_equal(1, Vote.get_votes_for_splitting)
  
  end
  
  test "should find number of no votes" do
  
   assert_equal(1, Vote.get_votes_against_splitting)
  
  end
end
