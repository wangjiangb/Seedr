require 'test_helper'

class RegisterControllerTest < ActionController::TestCase
  test "should get reg" do
    get :reg
    assert_response :success
  end

end
