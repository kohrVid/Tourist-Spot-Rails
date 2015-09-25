class User < ActiveRecord::Base
	has_many :purchases, foreign_key: :buyer_id
	has_many :services, through: :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
	  self.admin
  end

  def cart_count
	  $redis.scard "cart#{id}"
  end

  def cart_total_price
	  total_price = 0
	  get_cart_services.each { |service| total_price += service.price }
	  total_price
  end

  def get_cart_services
	  cart_ids = $redis.smembers "cart#{id}"
	  Service.find(cart_ids)
  end



  def purchase_cart_services!
	  get_cart_services.each { |service| purchase(service) }
	  $redis.del "cart#{id}"
  end

  def purchase(service)
	  services << service unless purchase?(service)
  end

  def purchase?(service)
	  service.include?(service)
  end

  def has_payment_info?
  end

  

 
end
