class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def authenticate_user
    redirect_to posts_path, :notice => "No!" unless session[:current_user]
  end
  
end
