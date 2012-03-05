class ReaderController < ApplicationController
  def index
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
    @search_bins = current_user.search_bins;
    if search_id!=nil
      search_bin = SearchBin.find_by_id(search_id)
      if search_bin==nil
        keywords = ""
      else
        keywords = search_bin.keywords
      end
    else
      if @search_bins!=nil
        search_bin = @search_bins[0]
        if search_bin==nil
          keywords = ""
        else
          keywords = search_bin.keywords
        end
      else
        keywords = ""
      end
    end
    if params[:keywords]!=nil
      keywords = params[:keywords]
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
