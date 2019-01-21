require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should not save user without email" do
    user = User.new
    assert_not user.save
  end
  
  test "password shound longer than 6" do
    user = User.new(email:"as@qq.com",password:"12345")
    assert_not user.save
  end
  
  test "should not save user without password" do
    user = User.new(email:"test@qq.com")
    assert_not user.save
  end
end
