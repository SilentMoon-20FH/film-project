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
  
  test "should not save user with the same email" do 
    user = User.new(email:"as@qq.com",password:"123456")
    user1 = User.new(email:"as@qq.com",password:"123456")
    assert user.save
    assert_not user1.save
  end
end
