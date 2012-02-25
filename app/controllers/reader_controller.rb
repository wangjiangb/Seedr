class ReaderController < ApplicationController
  def index
    keywords = params[:keywords]
    search_id = params[:post]
    if (search_id!=nil)
      search_id = search_id[:search_id]
    end
    logger.info search_id
    @search_bins = SearchBin.find(:all);
    if search_id!=nil
      search_bin = SearchBin.find_by_id(search_id)
      keywords = search_bin.keywords
    end
    logger.info keywords
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
