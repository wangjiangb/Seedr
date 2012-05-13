class AddSourceToLTweet < ActiveRecord::Migration
  def change
    add_column :l_tweets, :source, :integer
  end
end
