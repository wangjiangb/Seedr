require 'test_helper'

class TwitterAccountsControllerTest < ActionController::TestCase
  setup do
    @twitter_account = twitter_accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:twitter_accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create twitter_account" do
    assert_difference('TwitterAccount.count') do
      post :create, :twitter_account => @twitter_account.attributes
    end

    assert_redirected_to twitter_account_path(assigns(:twitter_account))
  end

  test "should show twitter_account" do
    get :show, :id => @twitter_account.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @twitter_account.to_param
    assert_response :success
  end

  test "should update twitter_account" do
    put :update, :id => @twitter_account.to_param, :twitter_account => @twitter_account.attributes
    assert_redirected_to twitter_account_path(assigns(:twitter_account))
  end

  test "should destroy twitter_account" do
    assert_difference('TwitterAccount.count', -1) do
      delete :destroy, :id => @twitter_account.to_param
    end

    assert_redirected_to twitter_accounts_path
  end
end
