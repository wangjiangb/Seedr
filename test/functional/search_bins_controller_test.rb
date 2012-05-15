require 'test_helper'

class SearchBinsControllerTest < ActionController::TestCase
  setup do
    @search_bin = search_bins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:search_bins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create search_bin" do
    assert_difference('SearchBin.count') do
      post :create, :search_bin => @search_bin.attributes
    end

    assert_redirected_to search_bin_path(assigns(:search_bin))
  end

  test "should show search_bin" do
    get :show, :id => @search_bin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @search_bin.to_param
    assert_response :success
  end

  test "should update search_bin" do
    put :update, :id => @search_bin.to_param, :search_bin => @search_bin.attributes
    assert_redirected_to search_bin_path(assigns(:search_bin))
  end

  test "should destroy search_bin" do
    assert_difference('SearchBin.count', -1) do
      delete :destroy, :id => @search_bin.to_param
    end

    assert_redirected_to search_bins_path
  end
end
