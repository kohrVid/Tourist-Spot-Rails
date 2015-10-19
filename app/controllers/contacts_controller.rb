class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(params[:contact])
		@contact.request = request
		if @contact.deliver
#			flash.now[:danger] = nil
			flash.now[:success] = "Thank you for your message. We normally respond within 24 hours."
			render 'thanks'
		else
			flash.now[:danger] = "Unable to send message. Please check and try again."
			render 'new'
		end
	end

	def thanks
	end
end
