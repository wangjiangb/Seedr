require 'test_helper'

class AboutusControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

end