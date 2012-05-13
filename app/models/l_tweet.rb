class LTweet < ActiveRecord::Base
  acts_as_indexed:fields=>[:title, :message]
  attr_accessor :final_weighting
  define_index do
    indexes title
    indexes message 
    has  created_at, updated_at
  end
  def self.search_by_keywords(keywords, page)
  end
end
