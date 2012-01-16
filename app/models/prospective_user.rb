class ProspectiveUser < ActiveRecord::Base
validates :fname, :lname, :email, :presence =>true
validates :email, :uniqueness =>true

end
