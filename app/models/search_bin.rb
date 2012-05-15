class SearchBin < ActiveRecord::Base
  validates :bin_name, :presence => true
  validates :keywords, :presence =>true
   validates :weight_friends, :presence =>true
 validates :weight_freshness, :presence =>true
 validates :weight_keyword, :presence =>true
 validates :weight_retweet, :presence =>true
 validates :weight_hasurl, :presence =>true
  belongs_to :user
end
