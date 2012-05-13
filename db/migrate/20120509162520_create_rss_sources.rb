class CreateRssSources < ActiveRecord::Migration
  def change
    create_table :rss_sources do |t|
      t.integer :user_id
      t.string :source_url

      t.timestamps
    end
  end
end
