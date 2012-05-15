require 'test_helper'

class FriendsWithsControllerTest < ActionController::TestCase
  setup do
    @friends_with = friends_withs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friends_withs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friends_with" do
    assert_difference('FriendsWith.count') do
      post :create, :friends_with => @friends_with.attributes
    end

    assert_redirected_to friends_with_path(assigns(:friends_with))
  end

  test "should show friends_with" do
    get :show, :id => @friends_with.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @friends_with.to_param
    assert_response :success
  end

  test "should update friends_with" do
    put :update, :id => @friends_with.to_param, :friends_with => @friends_with.attributes
    assert_redirected_to friends_with_path(assigns(:friends_with))
  end

  test "should destroy friends_with" do
    assert_difference('FriendsWith.count', -1) do
      delete :destroy, :id => @friends_with.to_param
    end

    assert_redirected_to friends_withs_path
  end
end
