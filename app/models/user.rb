class User < ActiveRecord::Base
  validates_presence_of :user_id, :email, :password #ensures fields aren't blanks
  
  
  def self.create_user!(params)
    
    params[:session_token] = SecureRandom.base64
    
    User.create!(params)
  end
end