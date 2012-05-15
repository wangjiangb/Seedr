require 'test_helper'

class ProspectiveUsersControllerTest < ActionController::TestCase
  setup do
    @prospective_user = prospective_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prospective_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prospective_user" do
    assert_difference('ProspectiveUser.count') do
      post :create, :prospective_user => @prospective_user.attributes
    end

    assert_redirected_to prospective_user_path(assigns(:prospective_user))
  end

  test "should show prospective_user" do
    get :show, :id => @prospective_user.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @prospective_user.to_param
    assert_response :success
  end

  test "should update prospective_user" do
    put :update, :id => @prospective_user.to_param, :prospective_user => @prospective_user.attributes
    assert_redirected_to prospective_user_path(assigns(:prospective_user))
  end

  test "should destroy prospective_user" do
    assert_difference('ProspectiveUser.count', -1) do
      delete :destroy, :id => @prospective_user.to_param
    end

    assert_redirected_to prospective_users_path
  end
end
