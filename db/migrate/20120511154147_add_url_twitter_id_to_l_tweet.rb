class AddUrlTwitterIdToLTweet < ActiveRecord::Migration
  def change
    add_column :l_tweets, :twitter_id, :integer
  end
end
