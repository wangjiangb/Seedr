class ReaderController < ApplicationController
  def index
    @user = current_user;
    if (current_user.active!=nil)
    if ( not current_user.active)
      redirect_to "/getstarted/welcome"
      return
    end
    end
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
    if (keywords=="")
      redirect_to("/settings/index")
      return;
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
    begin 
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
        search_bin.save
     rescue
     end	

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
      current_user_id = current_user.id
      search_expression = "@weight";
      search_expression = "(@weight*"+ (search_bin.weight_keyword/100).to_s() + "+ hasurl*"+search_bin.weight_hasurl.to_s()+"+1/(1+exp(-num_of_retweets/50.0))*"+search_bin.weight_retweet.to_s()+"*((user_id=="+current_user_id.to_s()+")*user_weighting)*"+search_bin.weight_friends.to_s()+"+(post_date)/145152.0/2*"+search_bin.weight_freshness.to_s()+")";

      logger.info("search experssion:"+search_expression)	
      if params[:source]=="All" or params[:source]==nil
       @news = LTweet.search(keywords, :match_mode => :boolean, :sort_mode=>:expr,:order=>search_expression,:page => params[:page],:per_page => 20)
       @source_id = 0
      elsif params[:source]=="Twitter"
             @news = LTweet.search(keywords, :match_mode => :boolean, :sort_mode=>:expr,:order=>search_expression,:page => params[:page],:per_page => 20,:with=>{:source_id=>1})
	     @source_id = 1
      else
             @news = LTweet.search(keywords, :match_mode => :boolean, :sort_mode=>:expr,:order=>search_expression,:page => params[:page],:per_page => 20,:with=>{:source_id=>0})
             @source_id = 2
      end
      user_twitter_id = current_user.twitter_accounts[0]
      @news.each_with_weighting do |item, weight|
        if item.source==1
	 item.message = item.message.gsub(/http:(.*?)(\s|$)/,'<a href="\0">\0</a>')
        end
 	if item.source==0
	  item.message = item.message.gsub(/\<\!\[CDATA\[/,'')
	end
         #logger.info item.title
         #logger.info "retweets:"+(1/(1+Math.exp(-item.num_of_retweets/50.0))).to_s()
         #logger.info( "freshness:"+(item.post_date.to_i()/145152.0/2).to_s())
         #logger.info( "freshness:"+item.post_date.to_s())
	 twitter_id = item.twitter_id;
         logger.info("Final weights:"+weight.to_s()); 
         logger.info("twitter_id"+twitter_id.to_s()); 
	 if (twitter_id==0)
	    item.final_weighting = weight
            next		
	 end

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
