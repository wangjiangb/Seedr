# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120430044200) do

  create_table "accounts", :primary_key => "twitter_id", :force => true do |t|
    t.string   "screen_name",      :null => false
    t.text     "description",      :null => false
    t.integer  "page",             :null => false
    t.integer  "statuses_count",   :null => false
    t.datetime "last_import",      :null => false
    t.integer  "followers_count",  :null => false
    t.integer  "friends_count",    :null => false
    t.integer  "favourites_count", :null => false
  end

  add_index "accounts", ["page"], :name => "page"

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facebook_accounts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.string   "stream_url"
    t.string   "access_token"
    t.string   "oauth_authorize_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follower_of", :primary_key => "follower_of_id", :force => true do |t|
    t.integer "parent", :null => false
    t.integer "child",  :null => false
  end

  create_table "friends_with", :primary_key => "friends_with_id", :force => true do |t|
    t.integer "parent",    :null => false
    t.integer "child",     :null => false
    t.float   "weighting", :null => false
  end

  add_index "friends_with", ["child"], :name => "child"
  add_index "friends_with", ["parent"], :name => "parent"
  add_index "friends_with", ["weighting"], :name => "weighting"

  create_table "l_tweets", :force => true do |t|
    t.integer  "tid"
    t.text     "title"
    t.text     "message"
    t.string   "user_id"
    t.integer  "num_of_retweets"
    t.integer  "num_of_replies"
    t.datetime "post_date"
    t.string   "sentiment"
    t.string   "question"
    t.string   "sp"
    t.integer  "newtweets"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prospective_users", :force => true do |t|
    t.string   "email"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_bins", :force => true do |t|
    t.string   "bin_name"
    t.integer  "user_id"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "todo", :primary_key => "todo_id", :force => true do |t|
    t.string   "what",                  :null => false
    t.integer  "number",   :limit => 8, :null => false
    t.integer  "doing",    :limit => 1, :null => false
    t.datetime "datetime",              :null => false
  end

  create_table "tweets", :primary_key => "tweet_id", :force => true do |t|
    t.integer  "twitter_id",                   :null => false
    t.string   "tweet",                        :null => false
    t.datetime "created_at",                   :null => false
    t.integer  "retweet_count",                :null => false
    t.string   "targeturl",     :limit => 256, :null => false
    t.string   "targetdomain",  :limit => 256, :null => false
  end

  add_index "tweets", ["tweet"], :name => "tweet"
  add_index "tweets", ["twitter_id"], :name => "twitter_id"

  create_table "tweets_valued", :primary_key => "tweets_valued_id", :force => true do |t|
    t.integer "tweet_id", :limit => 8, :null => false
    t.string  "keyword",               :null => false
    t.integer "value",    :limit => 1, :null => false
  end

  create_table "twitter_accounts", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "active"
    t.text     "stream_url"
    t.string   "oauth_token"
    t.string   "oauth_token_secret"
    t.string   "oauth_token_verifier"
    t.text     "oauth_authorize_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "email"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
