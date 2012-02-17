class ReaderController < ApplicationController
  def index
    keywords = params[:keywords]
    if keywords==nil or keywords==""
      @news = LTweet.order("post_date DESC").limit(10).find(:all)
    else
      keywords_arr = keywords.split(" ")
      @news = []
      keywords_arr.each do |keyword|
        @news |= LTweet.find_with_index(keyword,{:limit=>20,:order=>"post_date DESC"})
      end
    end
  end

  def setting
  end

  def analytics
  end



end
