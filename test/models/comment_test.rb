require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save comment without user_id" do
    comment = Comment.new(content:"just so so",score:6.0,game_id:1)
    assert_not comment.save
  end
  
  test "should not save comment without game_id" do
    comment = Comment.new(content:"just so so",score:6.0,user_id:1)
    assert_not comment.save
  end
  
  test "should not save comment without content" do
    comment = Comment.new(score:6.0,user_id:1,game_id:1)
    assert_not comment.save
  end
end
