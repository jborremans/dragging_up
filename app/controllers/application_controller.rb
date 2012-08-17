class ApplicationController < ActionController::Base
	protect_from_forgery

	helper_method :current_user

	def current_user
    @current_user ||= session[:current_user_id] && User.find_by_id(session[:current_user_id])
  end
  

	def require_login
    @user = User.find_by_id(session[:user_id])
    redirect_to root_url, notice: 'Please login.' unless @user
  end


end
