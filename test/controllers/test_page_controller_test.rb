require 'test_helper'

class TestPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get test_page_home_url
    assert_response :success
  end

end
