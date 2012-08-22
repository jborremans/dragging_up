class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
    
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
      
  def require_login
    @user = User.find_by_id(session[:user_id])
    redirect_to root_url, notice: 'Please login.' unless @user
  end
      
  def require_admin
    redirect_to root_url, notice: "Administrator Only" unless current_user.admin == true 
  end
  
  def require_authorization
    redirect_to root_url, notice: "Not authorized " unless session[:user_id] == Tool(params[:user_id])
    # :only => [:edit, :update, :delete]
  end
end
