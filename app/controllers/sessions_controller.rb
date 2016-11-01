class SessionsController < ApplicationController
    
  def user_params
    params.require(:user).permit(:user_id, :email, :session_token)
  end
    
  def new
    # default: render 'new' template
  end
  
  def create
    
    @user = User.find_by(user_params)
    
    if (!@user.nil?)
      flash[:notice] = "You are logged in as #{@user.user_id}."
      session[:session_token] = @user.session_token
      redirect_to movies_path
    else
      flash[:notice] = "Invalid user credentials. Re-enter, or click Sign-up for an account"
      redirect_to login_path
    end
    
  end

  def destroy
    session[:session_token] = nil
    redirect_to movies_path
  end
    
end