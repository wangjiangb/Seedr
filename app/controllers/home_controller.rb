class HomeController < ApplicationController
  def index
    @visitor = Visitor.new(params[:request])
    @visitor.IP = request.remote_ip
    browser_type = request.env['HTTP_USER_AGENT']
    @visitor.browser = browser_type 
    @visitor.save
  end

end
