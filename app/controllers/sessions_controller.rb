class SessionsController < ApplicationController
  skip_before_action :authorize
  def index
  end

  def new
  	if session[:user_id]
  	  redirect_to stories_url
  	end
  end

  def create
  	user = User.find_by(name: params[:name])
  	if user and user.authenticate(params[:password])
  	  session[:user_id] = user.id
  	  redirect_to stories_url
  	else
  		redirect_to login_url, alert: "Invalid username/passowrd combination"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to login_url, alert: "Logged out"
  end
end
