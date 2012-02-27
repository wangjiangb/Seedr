class ReaderController < ApplicationController
  def index
    keywords = params[:keywords]
    search_id = params[:post]

    if (search_id!=nil)
      search_id = search_id[:search_id]
    end
    if params[:page]==nil
      page_id = 1
    else
      page_id = params[:page]
    end
    logger.info search_id
    @search_bins = SearchBin.find(:all);
    if search_id!=nil
      search_bin = SearchBin.find_by_id(search_id)
      if search_bin==nil
        keywords = ""
      else
        keywords = search_bin.keywords        
      end
    end
    logger.info keywords
    if keywords==nil or keywords==""
      @news = LTweet.order("post_date DESC").limit(100).find(:all)
    else
      keywords_arr = keywords.split(" ")
      @news = []
      keywords_arr.each do |keyword|
        @news |= LTweet.find_with_index(keyword,{:order=>"post_date DESC"})
      end
    end
    message_id = params[:message_id]
    if message_id == nil
      @message = ""
    else
      @message = @news[Integer(message_id)].title
    end


  end

  def setting
  end

  def analytics
  end



end
