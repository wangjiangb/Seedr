class CreateSearchBins < ActiveRecord::Migration
  def change
    create_table :search_bins do |t|
      t.string :bin_name
      t.integer :user_id
      t.string :keywords

      t.timestamps
    end
  end
end
