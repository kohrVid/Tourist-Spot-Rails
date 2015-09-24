class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def cart_count
	  $redis.scard "cart#{id}"
  end

  def cart_total_price
	  total_price = 0
	  get_cart_services.each { |service| total_price += service.price }
	  total_price
  end

  def get_cart_movies
	  cart_ids = $redis.smembers "cart#{id}"
	  Service.find(cart_ids)
  end

 
end
