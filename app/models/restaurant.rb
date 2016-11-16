class Restaurant < ActiveRecord::Base
    has_secure_password
    has_many :deals
    
    before_save{|restaurant| restaurant.email = restaurant.email.downcase} 
    
    validates :name, presence: true, length: {minimum: 2, maximum: 50},
        uniqueness:{case_sensitive: false}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
        format:{with: VALID_EMAIL_REGEX}, 
        uniqueness:{case_sensitive: false} 
    
    
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence: true
    
    validates :location, presence: true
    validates :contact, presence: true
    validates :description, presence: true
     
    validates :terms_of_service, acceptance: true
   
    
    
    
    def Restaurant::create_restaurant!(restaurant_params)
        restaurant_params[:session_token] = SecureRandom.base64
        Restaurant.create!(restaurant_params)
    end
end
