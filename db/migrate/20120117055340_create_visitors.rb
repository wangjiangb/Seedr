class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.integer :id
      t.string :ip
      t.string :browser

      t.timestamps
    end
  end
end
