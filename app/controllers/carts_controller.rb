class CartsController < ApplicationController
	before_action :authenticate_user!
	
  def show
	  cart_ids = $redis.smember current_user_cart
	  @cart_services = Service.find(cart_ids)
  end

  def remove
	  $reddis.srem current_user_cart, params[:movie_id]
	  render json: current_user.cart_count, status: 200
  end

  private

  def current_user_cart
	  "cart#{current_user.id}"
  end
end
