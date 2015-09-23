class MainController < ApplicationController
	def index
		@carousel = Carousel.pluck(:id, :image_url, :image_description)
		
	end

end
