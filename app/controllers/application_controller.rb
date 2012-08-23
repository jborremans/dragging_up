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
  end
  
  def redirect_if_not_authorized(user_id)
  if @current_user && @current_user.id != user_id
  flash[:error] = 'You were not authorized to perform that action.'
  redirect_to :back
  end
  end

  # You can use before filters with this method like this:
  # 
  #   before_filter :only => [ :update, :destroy ] do |action|
  #   redirect_if_not_authorized(Comment.find(params[:id]).user_id)
  #   end
end
