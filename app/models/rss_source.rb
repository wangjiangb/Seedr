class RssSource < ActiveRecord::Base
  belongs_to :user
  validates :source_url, :presence => true
end
