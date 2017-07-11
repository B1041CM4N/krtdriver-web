class ProviderController < ApplicationController
  before_action :authenticate_user!, :set_module

  respond_to :js, :html

  def index
    @provider = Provider.new
    @providers = Provider.where(store_id: params[:store_id]).order(provider_id: :asc).page params[:page]
  end

  def new
    @provider = Provider.new
    @vehicle = Vehicle.new
  end

  def create
    Rails.logger.info 'PARAMS: ' + params.inspect + ' *********'

    vehicle = Vehicle.create(vehicle_brand_id: params[:vehicle][:vehicle_brand_id], vehicle_model: params[:vehicle][:vehicle_model],
    licence_plate: params[:vehicle][:licence_plate], color: params[:vehicle][:color])

    @provider = Provider.new(first_name: params[:provider][:first_name], last_name: params[:provider][:last_name],
    rut: params[:provider][:rut], email: params[:provider][:email], password: params[:provider][:password],
    store_id: params[:store_id], vehicle_id: vehicle.vehicle_id)

    if @provider.password == params[:provider][:password_confirmation]
      if @provider.save
        flash[:success] = 'Proveedor creado exitosamente!'
        redirect_to root_url
      else
        flash[:alert] = "Ha ocurrido un problema al tratar de crear al proveedor y/o sus datos asociados"
        # @providers = Provider.all.order(provider_id: :asc)
        return @provider, @vehicle
        render :new
      end
    else
      flash[:alert] = "Las contraseñas ingresadas no coinciden"
      redirect_to @provider
    end
  end

  def edit
    @provider = Provider.find(params[:id])
    @vehicle = @provider.vehicle
  end

  def update
    @provider = Provider.find(params[:id])
    @provider.vehicle = Vehicle.update(vehicle_brand_id: params[:vehicle][:vehicle_brand_id], vehicle_model: params[:vehicle][:vehicle_model],
    licence_plate: params[:vehicle][:licence_plate], color: params[:vehicle][:color])

    if params[:provider][:password] == params[:provider][:password_confirmation]
      if @provider.update(first_name: params[:provider][:first_name], last_name: params[:provider][:last_name],
      rut: params[:provider][:rut], email: params[:provider][:email], password: params[:provider][:password],
      store_id: params[:store_id], vehicle_id: vehicle.vehicle_id)
        flash[:success] = 'Proveedor modificado exitosamente'
        redirect_to root_url
      else
        @providers = Provider.all.order(provider_id: :asc)
        redirect_to action: :index
      end
    else
      flash[:alert] = "Las contraseñas ingresadas no coinciden"
      redirect_to :back
    end
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
  end

  private

  def root_url
    store_provider_index_url(params[:store_id])
  end

  def set_module
    @module = 'provider'
  end

  # def provider_params
  #   params.require(:provider).permit!
  # end
end
