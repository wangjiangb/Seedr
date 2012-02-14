class ReaderController < ApplicationController
  def index
    @news = LTweet.order("post_date DESC").limit(10).find(:all)
  end

  def setting
  end

  def analytics
  end



end
