require 'test_helper'

class GetstartedControllerTest < ActionController::TestCase
  test "should get twitter" do
    get :twitter
    assert_response :success
  end

  test "should get topic" do
    get :topic
    assert_response :success
  end

end
