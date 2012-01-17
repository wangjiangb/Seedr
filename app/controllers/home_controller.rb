class HomeController < ApplicationController
  def index
    @visitor = Visitor.new()
    @visitor.IP = request.remote_ip
    @visitor.browser = request.env['HTTP_USER_AGENT'] 
    @visitor.save
  end

  def about
  end
  def register
  end
end
