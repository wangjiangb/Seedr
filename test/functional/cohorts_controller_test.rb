require 'test_helper'

class CohortsControllerTest < ActionController::TestCase
  setup do
    @cohort = cohorts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cohorts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cohort" do
    assert_difference('Cohort.count') do
      post :create, :cohort => @cohort.attributes
    end

    assert_redirected_to cohort_path(assigns(:cohort))
  end

  test "should show cohort" do
    get :show, :id => @cohort.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cohort.to_param
    assert_response :success
  end

  test "should update cohort" do
    put :update, :id => @cohort.to_param, :cohort => @cohort.attributes
    assert_redirected_to cohort_path(assigns(:cohort))
  end

  test "should destroy cohort" do
    assert_difference('Cohort.count', -1) do
      delete :destroy, :id => @cohort.to_param
    end

    assert_redirected_to cohorts_path
  end
end
