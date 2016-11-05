class Restaurant < ActiveRecord::Base
    has_many :deals
    
    before_save{|user| user.email = user.email.downcase} 
    
    validates :name, presence: true, length: {maximum: 50} 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
        format:{with: VALID_EMAIL_REGEX}, 
        uniqueness:{case_sensitive: false} 
    
    def self.create_restaurant! (restaurant_params)
        restaurant_params[:session_token] = SecureRandom.base64
        Restaurant.create!(restaurant_params)
    end
end
