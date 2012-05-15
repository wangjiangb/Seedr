class Comment < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :email => true
  validates :comments, :presence =>true
end
