class CreateProspectiveUsers < ActiveRecord::Migration
  def change
    create_table :prospective_users do |t|
      t.integer :id
      t.string :fname
      t.string :lname
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
