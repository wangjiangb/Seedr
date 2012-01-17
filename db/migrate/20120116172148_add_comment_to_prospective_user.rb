class AddCommentToProspectiveUser < ActiveRecord::Migration
  def change
    add_column :prospective_users, :comment, :text
  end
end
