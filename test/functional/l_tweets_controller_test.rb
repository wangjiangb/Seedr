require 'test_helper'

class LTweetsControllerTest < ActionController::TestCase
  setup do
    @l_tweet = l_tweets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:l_tweets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create l_tweet" do
    assert_difference('LTweet.count') do
      post :create, :l_tweet => @l_tweet.attributes
    end

    assert_redirected_to l_tweet_path(assigns(:l_tweet))
  end

  test "should show l_tweet" do
    get :show, :id => @l_tweet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @l_tweet.to_param
    assert_response :success
  end

  test "should update l_tweet" do
    put :update, :id => @l_tweet.to_param, :l_tweet => @l_tweet.attributes
    assert_redirected_to l_tweet_path(assigns(:l_tweet))
  end

  test "should destroy l_tweet" do
    assert_difference('LTweet.count', -1) do
      delete :destroy, :id => @l_tweet.to_param
    end

    assert_redirected_to l_tweets_path
  end
end
