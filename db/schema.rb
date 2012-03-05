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

ActiveRecord::Schema.define(:version => 20120305211651) do

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "search_bins", :force => true do |t|
    t.string   "bin_name"
    t.integer  "user_id"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
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
