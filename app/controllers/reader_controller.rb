class ReaderController < ApplicationController
  def index
    keywords = params[:keywords]
    if keywords==nil
      @news = LTweet.order("post_date DESC").limit(10).find(:all)
    else
      @news = LTweet.find_with_index(keywords,{:limit=>20,:order=>"post_date DESC"})
    end
  end

  def setting
  end

  def analytics
  end



end
