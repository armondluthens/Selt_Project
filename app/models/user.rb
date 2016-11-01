class User < ActiveRecord::Base
  def self.create_user!(params)
    
    params[:session_token] = SecureRandom.base64
    
    User.create!(params)
  end
end