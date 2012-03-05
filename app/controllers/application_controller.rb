class ApplicationController < ActionController::Base

    before_filter :authorize
  protect_from_forgery
    helper_method :current_user

    private

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end

end
