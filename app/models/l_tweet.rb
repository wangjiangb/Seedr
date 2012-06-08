class LTweet < ActiveRecord::Base
  has_one :tweets_weight
  acts_as_indexed:fields=>[:title, :message]
  attr_accessor :final_weighting
  define_index do
    join l_tweet.tweets_weight
    indexes title
    indexes message 
    has  created_at, updated_at
    has post_date
    has hasurl
    has num_of_retweets
    has :source, :as => :source_id
    has tweets_weight.user_id, :as=>:user_id 
    has tweets_weight.user_weigting, :as=>:user_weighting 	
  end
  def self.search_by_keywords(keywords, page)
  end
end

