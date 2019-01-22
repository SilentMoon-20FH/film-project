require 'test_helper'

class RelationGameTagTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without information" do
    rgametag = Rgametag.new
    assert_not rgametag.save
  end
  test "should not save without tag_id " do
    rgametag = Rgametag.new(game_id:1)
    assert_not rgametag
  end
  test "should not save without game id" do
    rgametag = Rgametag.new(tag_id:1)
    assert_not rgametag.save
  end
  test "should not save the same information"  do
    rgametag = Rgametag.new(game_id:1,tag_id:1)
    rgametag1 = Rgametag.new(game_id:1,tag_id:2)
    assert_not  rgametag1.save
  end
end
