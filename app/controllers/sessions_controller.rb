class SessionsController < ApplicationController
  def session_params
    params.require(:session).permit(:restaurant_id, :email, :session_token)
  end
  
  def new
  end

  def create
  end

  def destroy
  end
end
