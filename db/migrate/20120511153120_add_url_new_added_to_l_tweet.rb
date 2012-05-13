class AddUrlNewAddedToLTweet < ActiveRecord::Migration
  def change
    add_column :l_tweets, :hasurl, :string
    add_column :l_tweets, :newadded, :integer
  end
end
