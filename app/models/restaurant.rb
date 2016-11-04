class Restaurant < ActiveRecord::Base
    has_many :deals
    validates_presence_of :name, :email, :password
    
    def self.create_restaurant! (restaurant_params)
        restaurant_params[:session_token] = SecureRandom.base64
        Restaurant.create!(restaurant_params)
    end
end
