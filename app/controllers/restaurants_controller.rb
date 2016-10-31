class RestaurantsController < ApplicationController
  #
  def movie_params
    params.require(:restaurant).permit(:name, :location, :description)
  end
end
  