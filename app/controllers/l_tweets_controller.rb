class LTweetsController < ApplicationController
  # GET /l_tweets
  # GET /l_tweets.json
  def index
    @l_tweets = LTweet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @l_tweets }
    end
  end

  # GET /l_tweets/1
  # GET /l_tweets/1.json
  def show
    @l_tweet = LTweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @l_tweet }
    end
  end

  # GET /l_tweets/new
  # GET /l_tweets/new.json
  def new
    @l_tweet = LTweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @l_tweet }
    end
  end

  # GET /l_tweets/1/edit
  def edit
    @l_tweet = LTweet.find(params[:id])
  end

  # POST /l_tweets
  # POST /l_tweets.json
  def create
    @l_tweet = LTweet.new(params[:l_tweet])

    respond_to do |format|
      if @l_tweet.save
        format.html { redirect_to @l_tweet, :notice => 'L tweet was successfully created.' }
        format.json { render :json => @l_tweet, :status => :created, :location => @l_tweet }
      else
        format.html { render :action => "new" }
        format.json { render :json => @l_tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /l_tweets/1
  # PUT /l_tweets/1.json
  def update
    @l_tweet = LTweet.find(params[:id])

    respond_to do |format|
      if @l_tweet.update_attributes(params[:l_tweet])
        format.html { redirect_to @l_tweet, :notice => 'L tweet was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @l_tweet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /l_tweets/1
  # DELETE /l_tweets/1.json
  def destroy
    @l_tweet = LTweet.find(params[:id])
    @l_tweet.destroy

    respond_to do |format|
      format.html { redirect_to l_tweets_url }
      format.json { head :ok }
    end
  end
end
