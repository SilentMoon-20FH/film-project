require 'test_helper'

class TagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should  not save without tag name" do
    tag= Tag.new
    assert_not tag.save
  end
  
  test "should_not save with the same tag name" do
    tag = Tag.new(name:"abc")
    tag1 = Tag.new(name:"abc")
    assert tag.save
    assert_not tag1.save
  end
end
