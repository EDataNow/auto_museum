class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  before_action :authorize, only: :index

  protected
  	def authorize
	   unless User.find_by(id: session[:user_id])
		  redirect_to login_url, alert: "Pleas log in"
	   end
  	end
end
