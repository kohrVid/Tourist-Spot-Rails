class ContactsController < ApplicationController
	def new
		@contact = Contact.new
		if 
			Contact.new(params[:contact]).deliver
		end
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
#			flash.now[:danger] = nil
			flash.now[:success] = "Thank you for your message. We normally respond within 24 hours."
		else
			flash.now[:danger] = "Unable to send message. Please check and try again."
			render :new
		end
	end
end
