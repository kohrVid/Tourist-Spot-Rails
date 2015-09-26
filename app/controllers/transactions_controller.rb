class TransactionsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_cart!

  def new
	  gon.client_token = generate_new_client_token
  end

  def create
	  unless current_user.has_payment_info?
		  @result = Braintree::Transaction.sale(
			  amount: current_user.cart_total_price,
			  payment_method_nonce: params[:payment_method_nonce],
			  customer: {
				  first_name: params[:first_name],
				  last_name: params[:last_name],
				  company: params[:company],
				  email: params[:email],
				  phone: params[:phone]
			  },
			  options: {
				  store_in_vault: true
			  }
		  )
	  else
		  @result = Braintree::Transaction.sale(
			  amount: current_user.cart_total_price,
			  payment_method_nonce: params[:payment_method_nonce]
		  )
	  end

	  if @result.success?
		  current_user.update(braintree_customer_id: @result.transaction.customer_details.id) unless current_user.has_payment_info?
		  current_user.purchase_cart_services!
		  redirect_to root_url
		  flash[:success] = "Congratulations, your transaction has been successful!"
	  else
		  flash[:danger] = "Something went wrong while processing your transaction."
		  gon.client_token = generate_new_client_token
		  render :new
	  end
  end


  
  private

  def check_cart!
	  if current_user.get_cart_services.blank?
		  redirect_to root_url, alert: "Please add an item to your cart before processng our transaction."
	  end
  end

  def generate_new_client_token
	  Braintree::ClientToken.generate
  end


end
