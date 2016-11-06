class RestaurantMailer < ApplicationMailer
  
  default from: 'ta.cindylynn@gmail.com'
 
  def registration_confirmation(restaurant)
    @restaurant = restaurant
    @url = 'https://example.com/'
    #@url  = 'https://cryptic-wildwood-33336.herokuapp.com/restaurants/' + @restaurant.id + '/edit' ## needs the sign-up INDIVIDUAL URL here.
    mail(to: @restaurant.email, subject: 'Registration Confirmation')
  end
  
end
