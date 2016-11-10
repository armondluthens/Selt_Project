class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:user_id, :email, :password, :session_token)
  end
  
  def new
    # default: render 'new' template
  end
  
  def index
    @users = User.all
  end
  
  def show
    id = params[:id] # retrieve ID from URI route
    @user = User.find(id) # look up by unique ID
    # will render app/views/movies/show.<extension> by default
    
  end
  
  def edit
    @user = User.find params[:id]
  end
    
  def create
    
    if User.exists?(:user_id => user_params[:user_id])
      flash[:notice] = "Username is unavailable."
      redirect_to login_path
    elsif user_params[:user_id] = nil
      
    
      
    else
      User.create_user!(user_params);
      flash[:notice] = "Welcome #{user_params[:user_id]}. Your account has been created."
      redirect_to login_path
    end
    
  end
  
  
end