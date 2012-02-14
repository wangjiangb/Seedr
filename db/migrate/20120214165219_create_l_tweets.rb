class CreateLTweets < ActiveRecord::Migration
  def change
    create_table :l_tweets do |t|
      t.integer :tid
      t.text :title
      t.text :message
      t.string :user_id
      t.integer :num_of_retweets
      t.integer :num_of_replies
      t.datetime :post_date
      t.string :sentiment
      t.integer :question
      t.integer :sp
      t.integer :newtweets

      t.timestamps
    end
  end
end
