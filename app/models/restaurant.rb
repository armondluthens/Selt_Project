class Restaurant < ActiveRecord::Base
    has_many :deals
    #has_secure_password
    before_save{|user| user.email = user.email.downcase} 
    
    validates :name, presence: true, length: {minimum: 3, maximum: 50} 
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
        format:{with: VALID_EMAIL_REGEX}, 
        uniqueness:{case_sensitive: false} 
    #validates :password, length: {minimum: 6} 
    #validates :password_confirmation 
    #validates :terms_of_service, acceptance: true
    
    def self.create_restaurant! (restaurant_params)
        restaurant_params[:session_token] = SecureRandom.base64
        Restaurant.create!(restaurant_params)
    end
end
