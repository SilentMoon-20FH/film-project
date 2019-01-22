require 'test_helper'

class FollowshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  #
  test "should not save followship without follower_id" do
    followship=Followship.new(followed_id:1)
    assert_not followship.save
  end
  
  test "should not save followship without followed_id" do
    followship = Followship.new(follower_id:2)
    assert_not followship.save
  end
end
