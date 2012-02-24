class SearchBin < ActiveRecord::Base
  validates :bin_name, :presence => true
  validates :keywords, :presence =>true
  belongs_to :user
end
