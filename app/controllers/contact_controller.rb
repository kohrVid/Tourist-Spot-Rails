class ContactController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
			flash.now[:error] = nil
			flash.now[:notice] = "Thank you for your message. We normally respond within 24 hours."
		else
			flash.now[:error] = "Unable to send message. Please check and try again."
			render :new
		end
	end
end
