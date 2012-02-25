class LTweet < ActiveRecord::Base
  acts_as_indexed:fields=>[:title, :message]
  def self.search_by_keywords(keywords, page)
    
  end
end
