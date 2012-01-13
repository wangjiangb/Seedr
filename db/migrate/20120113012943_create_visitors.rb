class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.integer :id
      t.string :IP
      t.string :browser
      t.integer :cohort_id

      t.timestamps
    end
  end
end
