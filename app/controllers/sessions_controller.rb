class SessionsController < ApplicationController
  def new
  end

  def create
	if user = User.authenticate(params[:name], params[:password])
		session[:user_id] = user.id
        logger.info "i am hereeeeeee   "+"redirect_to admin_url"
		redirect_to admin_url
	else
        logger.info "i am hereeeeeee   "+"redirect_to login"
		redirect_to login_url, :alert => "Invalid user/password combination"
	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to login_url, :notice => "Logged out"
  end

end
