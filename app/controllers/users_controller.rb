class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end
  
  def new
    # default: render 'new' template
  end
  
  def index
    @users = User.all
  end
    
  def create
    
    if User.exists?(:user_id => user_params[:user_id])
      flash[:notice] = "Username is unavailable."
      redirect_to login_path
      
    else
      User.create_user!(user_params);
      flash[:notice] = "Welcome #{user_params[:user_id]}. Your account has been created."
      redirect_to login_path
    end
    
  end
  
  
end