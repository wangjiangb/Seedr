class AddIndexToLTweets < ActiveRecord::Migration
  def change
    suppress_messages {add_index :l_tweets, :tid}
    suppress_messages {add_index :l_tweets, :twitter_id}
    say "and an index!", true
  end
end
1
