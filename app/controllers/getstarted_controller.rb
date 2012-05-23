class GetstartedController < ApplicationController
  skip_before_filter :authorize
  
  def twitter
  end

  def topic
    @search_bin = SearchBin.new    
  end

  def welcome
  end
end
