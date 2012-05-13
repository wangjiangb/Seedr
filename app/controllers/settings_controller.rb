class SettingsController < ApplicationController
  def index
    @rss_source = RssSource.new
  end

end
