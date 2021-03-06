class ProviderController < ApplicationController
  before_action :authenticate_user!, :set_module

  respond_to :js, :html

  def index
    respond_to do |format|
      format.html {
        @provider = Provider.new
        @providers = Provider.where(store_id: params[:store_id]).order(provider_id: :asc).page params[:page]
      }
      format.xlsx {
        @providers = Provider.where(store_id: params[:store_id]).order(provider_id: :asc)
      }
    end
  end

  def new
    @provider = Provider.new
    @vehicle = Vehicle.new
  end

  def create
    @vehicle = Vehicle.new(vehicle_brand_id: params[:vehicle][:vehicle_brand_id], vehicle_model: params[:vehicle][:vehicle_model],
    licence_plate: params[:vehicle][:licence_plate], color: params[:vehicle][:color])
    if @vehicle.save
      @provider = Provider.new(first_name: params[:provider][:first_name], last_name: params[:provider][:last_name],
      rut: params[:provider][:rut].gsub('.', ''), email: params[:provider][:email], password: params[:provider][:password],
      store_id: params[:store_id], vehicle_id: @vehicle.vehicle_id)
      if @provider.save
        flash[:notice] = 'El proveedor ha sido creado exitosamente!'
        redirect_to root_url
      else
        @provider
        @vehicle.destroy
        @vehicle = Vehicle.new
        render :new
      end
    else
      @provider = Provider.new
      @vehicle = Vehicle.new
    end
  end

  def edit
    @provider = Provider.find(params[:id])
    @vehicle = @provider.vehicle
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.vehicle = Vehicle.update(vehicle_brand_id: params[:vehicle][:vehicle_brand_id], vehicle_model: params[:vehicle][:vehicle_model],
      licence_plate: params[:vehicle][:licence_plate], color: params[:vehicle][:color])
      if @provider.update(first_name: params[:provider][:first_name], last_name: params[:provider][:last_name],
        rut: params[:provider][:rut], email: params[:provider][:email], password: params[:provider][:password],
        store_id: params[:store_id], vehicle_id: vehicle.vehicle_id)
        format.html { redirect_to root_url, @providers = Provider.where(store_id: params[:store_id]).order(provider_id: :asc), notice: 'El proveedor ha sido creada exitosamente' }
        format.json { render :show, status: :created, location: @provider }
      else
        @provider
        @vehicle = @provider.vehicle
        render :edit
      end
    else
      @vehicle = @provider.vehicle
      format.html { redirect_to action: :edit }
      format.json { render :json, @provider.vehicle.errors, status: :unprocessable_entity }
    end
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def destroy
    @provider = Provider.find(params[:id])
    @provider.destroy
    redirect_to root_url
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
