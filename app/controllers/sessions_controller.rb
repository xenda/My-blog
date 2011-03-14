class SessionsController < ApplicationController
  
  before_filter :authenticate_user, :only => :destroy
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    registered_user = User.find_by_email(@user.email)
    unless registered_user
        redirect_to posts_path, :notice => "No existe"
    else
        if registered_user.match(@user)
          session[:current_user] = registered_user.id
          redirect_to posts_path, :notice => "Bienvenido"
        else
          redirect_to posts_path, :notice => "Clave errada"
        end
    end
  end
  
  def destroy
    session[:current_user] = nil
    redirect_to posts_path
  end
  
end