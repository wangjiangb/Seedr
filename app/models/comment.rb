class Comment < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true,   :email => true
  validates :comments, :presence =>true
end
