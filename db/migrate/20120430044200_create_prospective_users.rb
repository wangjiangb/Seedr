class CreateProspectiveUsers < ActiveRecord::Migration
  def change
    create_table :prospective_users do |t|
      t.string :email
      t.string :comment

      t.timestamps
    end
  end
end
