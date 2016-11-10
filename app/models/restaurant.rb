class Restaurant < ActiveRecord::Base
    has_many :deals
    
    #has_secure_password
    
    before_save{|restaurant| restaurant.email = restaurant.email.downcase} 
    
    validates :name, presence: true, length: {minimum: 2, maximum: 50},
        uniqueness:{case_sensitive: false}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
        format:{with: VALID_EMAIL_REGEX}, 
        uniqueness:{case_sensitive: false} 
    validates :password, length: {minimum: 6}, :confirmation => true 
    validates :password_confirmation, :presence => true
    #validates_confirmation_of :password
     
    validates :terms_of_service, acceptance: true
   
    
    
    
    def Restaurant::create_restaurant!(restaurant_params)
        restaurant_params[:session_token] = SecureRandom.base64
        Restaurant.create!(restaurant_params)
    end
end
