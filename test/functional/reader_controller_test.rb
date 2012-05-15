require 'test_helper'

class ReaderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get setting" do
    get :setting
    assert_response :success
  end

  test "should get analytics" do
    get :analytics
    assert_response :success
  end

end
