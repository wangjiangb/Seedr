require 'test_helper'

class SuggestedKeywordsControllerTest < ActionController::TestCase
  setup do
    @suggested_keyword = suggested_keywords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suggested_keywords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suggested_keyword" do
    assert_difference('SuggestedKeyword.count') do
      post :create, :suggested_keyword => @suggested_keyword.attributes
    end

    assert_redirected_to suggested_keyword_path(assigns(:suggested_keyword))
  end

  test "should show suggested_keyword" do
    get :show, :id => @suggested_keyword.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @suggested_keyword.to_param
    assert_response :success
  end

  test "should update suggested_keyword" do
    put :update, :id => @suggested_keyword.to_param, :suggested_keyword => @suggested_keyword.attributes
    assert_redirected_to suggested_keyword_path(assigns(:suggested_keyword))
  end

  test "should destroy suggested_keyword" do
    assert_difference('SuggestedKeyword.count', -1) do
      delete :destroy, :id => @suggested_keyword.to_param
    end

    assert_redirected_to suggested_keywords_path
  end
end
