class LTweet < ActiveRecord::Base
  acts_as_indexed:fields=>[:title, :message]
  define_index do
    indexes tittle, :sortable => true
    indexes message 
    has  created_at, updated_at
  end
  def self.search_by_keywords(keywords, page)
  end
end
