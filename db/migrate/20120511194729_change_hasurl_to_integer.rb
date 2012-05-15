class ChangeHasurlToInteger < ActiveRecord::Migration
  def up
    change_column(:l_tweets, :hasurl, :integer)
  end

  def down
  end
end
