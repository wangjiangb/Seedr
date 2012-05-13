class CreateTmpRankings < ActiveRecord::Migration
  def change
    create_table :tmp_rankings do |t|
      t.integer :l_tweet_id
      t.integer :search_bin_id
      t.float :weighting

      t.timestamps
    end
  end
end
