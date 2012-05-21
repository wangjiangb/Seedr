class ReaderController < ApplicationController
  def index
    @search_id = params[:post]
    @message = params[:message]
    if (@search_id!=nil)
      @search_id = @search_id[:search_id]
    end
    if (params[:search_id]!=nil)
      @search_id = params[:search_id]
    end
    if params[:page]==nil
      page_id = 1
    else
      page_id = params[:page]
    end
    logger.info @search_id
    @search_bins = current_user.search_bins;
    if @search_id!=nil
      search_bin = SearchBin.find_by_id(@search_id)
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
    if search_bin!=nil      
      if params[:weight_keywords]==nil        
        if (search_bin.weight_keyword==nil)
          search_bin.weight_keyword = 1
        end
         if (search_bin.weight_freshness==nil)
          search_bin.weight_freshness = 1
        end
        if (search_bin.weight_friends==nil)
          search_bin.weight_friends = 1
        end
        if (search_bin.weight_retweet==nil)
          search_bin.weight_retweet = 1
        end
        if (search_bin.weight_hasurl==nil)
          search_bin.weight_hasurl = 1
        end        
        @weight_keywords = search_bin.weight_keyword
        @weight_freshness = search_bin.weight_freshness
        @weight_friends = search_bin.weight_friends
        @weight_retweet = search_bin.weight_retweet
        @weight_hasurl = search_bin.weight_hasurl
      else
        @weight_keywords = params[:weight_keywords]
        @weight_freshness = params[:weight_freshness]
        @weight_friends = params[:weight_friends]
        @weight_retweet = params[:weight_retweets]
        @weight_hasurl = params[:weight_hasurl]
        search_bin.weight_keyword=@weight_keywords
        search_bin.weight_freshness=@weight_freshness
        search_bin.weight_friends=@weight_friends
        search_bin.weight_retweet=@weight_retweet
        search_bin.weight_hasurl=@weight_hasurl
        search_bin.save!
      end
      
    end
    if params[:keywords]!=nil
      keywords = params[:keywords]
    end
    logger.info keywords
    if keywords==nil or keywords==""
      @news = LTweet.order("post_date DESC").limit(100).find(:all)
    else
      # keywords_arr = keywords.split(" ")
      # @news = []
      # keywords_arr.each do |keyword|
      #   @news |= LTweet.find_with_ferret(keywords)
      # end
      @news = LTweet.search(keywords,:match_mode=>:extended)
      if params[:keywords]==nil
        @news.each_with_weighting do |item, weight|
	  friends =[]
          logger.info("twitter_id:"+item.twitter_id.to_s())
          if (item.twitter_id.to_s()=="")
	     twitter_id ="1"
	  else
	     twitter_id = item.twitter_id.to_s()
	  end			
          #friends = FriendsWith.connection.execute("select * from friends_with where child="+twitter_id)
          if (friends.length==0)
            friends_weighting = 0
          else
            friends_weighting = friends.each[0]["weighting"]*search_bin.weight_friends
          end
          timing_weighting = ([(item.post_date.to_datetime - DateTime.now), -3600*24*70].max)/(24*70)*search_bin.weight_freshness
          if (item.hasurl==0||item.hasurl==nil||item.hasurl=="")
            has_url_weigting = 0
          else
            has_url_weigting = search_bin.weight_hasurl;
          end          
	  logger.info(item.title)
          logger.info("timing:"+timing_weighting.to_s())
          logger.info("weight:"+weight.to_s())
          logger.info("has_url:"+has_url_weigting.to_s())
          logger.info("retweet:"+item.num_of_retweets.to_s())
          logger.info("friends:"+friends_weighting.to_s())
          final_weighting =timing_weighting + has_url_weigting + friends_weighting * search_bin.weight_friends + item.num_of_retweets*search_bin.weight_retweet + weight*search_bin.weight_keyword/100
          item.final_weighting = final_weighting
	  logger.info("final weighting:"+final_weighting.to_s())
        end
         @news.sort! { |a,b| -a.final_weighting <=> -b.final_weighting}
      end
       # @news = LTweet.find_by_sql("SELECT t.* , a.screen_name, (k.weighting * [WEIGHTING_WITH_TYPE_1] + f.weighting * [WEIGHTING_WITH_TYPE_2] + hasurl * [WEIGHTING_WITH_TYPE_3] + retweet_count * [WEIGHTING_WITH_TYPE_4] + GREATEST((70 - datediff(CURDATE(), created_at)) / 70, 0) * [WEIGHTING_WITH_TYPE_5]) AS ultimateweighting FROM tweets t, friends_with f, accounts a, tmp_ranking k WHERE  f.parent = 23453742 AND f.child = t.twitter_id AND a.twitter_id = t.twitter_id AND t.tweet_id = k.tweet_id AND k.bin_id = {BIN_ID} ORDER BY ultimateweighting DESC LIMIT 0,250")
    end
    message_id = params[:message_id]
    if message_id == nil
      @message = ""
    else
      @message = @news[Integer(message_id)].title
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json 
      format.js 
    end

  end

  def update_news
  end
  def setting
  end

  def analytics
  end



end
