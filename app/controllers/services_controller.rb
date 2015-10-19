class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  def index
    @services = Service.all
  end

  def show
	  @service = Service.find(params[:id])
	  @cart_action = @service.cart_action current_user.try :id
  end

  def new
    @service = Service.new
    if current_user && current_user.admin?
	 render 'new'
    else
	 render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
 

  def edit
	 if current_user && current_user.admin?
		 render 'edit'
	 else
		 render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
	 end

  end

  def create
    if current_user && current_user.admin?
	    @service = Service.new(service_params)

	    respond_to do |format|
	      if @service.save
		format.html { redirect_to @service, notice: 'Service was successfully created.' }
	      else
		format.html { render :new }
	      end
	    end
    end
  end

  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_params
      params.require(:service).permit(:name, :price, :contents, :guide, :room, :food)
    end
end
