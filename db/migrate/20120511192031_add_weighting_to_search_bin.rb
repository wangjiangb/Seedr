class AddWeightingToSearchBin < ActiveRecord::Migration
  def change
    add_column :search_bins, :weight_friends, :float
    add_column :search_bins, :weight_keyword, :float
    add_column :search_bins, :weight_hasurl, :float
    add_column :search_bins, :weight_retweet, :float
    add_column :search_bins, :weight_freshness, :float
  end
end
