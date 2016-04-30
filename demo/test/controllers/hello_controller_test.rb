require 'test_helper'

class HelloControllerTest < ActionController::TestCase
  test "should get hi" do
    get :hi
    assert_response :success
  end

end
