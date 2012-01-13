class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.integer :id
      t.string :name
      t.timestamp :start
      t.timestamp :end

      t.timestamps
    end
  end
end
