require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without game name" do
    game = Game.new
    assert_not game.save
  end
  
end
