class LTweet < ActiveRecord::Base
  acts_as_indexed:fields=>[:title, :message]
end
