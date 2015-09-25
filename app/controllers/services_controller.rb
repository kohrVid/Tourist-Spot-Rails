class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
    @services.each do |service|
	    @cart_action = service.cart_action current_user.try :id
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
	  @service = Service.find(params[:id])
	  @cart_action = @service.cart_action current_user.try :id
#	 @admin = User.find(current_user.id).admin unless current_user.id.nil?
  end

  # GET /services/new
  def new
    @service = Service.new
    if current_user && current_user.admin?
	 render 'new'
    else
	 render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end

  end
 

  # GET /services/1/edit
  def edit
	 if current_user && current_user.admin?
		 render 'edit'
	 else
		 render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
	 end

  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
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

  # DELETE /services/1
  # DELETE /services/1.json
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
