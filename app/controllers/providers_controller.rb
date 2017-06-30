class ProvidersController < ApplicationController
  before_action :authenticate_user!, :set_module

  respond_to :js, :html

  def index
    @provider = Provider.new
    @providers = Provider.all.order(id: :asc).page params[:page]
  end

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider.save
      flash[:success] = 'Proveedor creado exitosamente!'
      redirect_to root_url
    else
      @providers = Provider.all.order(id: :asc)
      redirect_to action: :index
    end
  end

  def edit
    @provider = Provider.find(params[:id])
  end

  def update
    @provider = Provider.find(params[:id])
    if @provider.update_attributes(provider_params)
      flash[:success] = 'Proveedor modificado exitosamente'
      redirect_to root_url
    else
      @providers = Provider.all.order(id: :asc)
      redirect_to action: :index
    end
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def destroy
    @provider = Driver.find(params[:id])
    @provider.destroy
    redirect_to root_url
  end

  private

  def root_url
    return providers_url
  end

  def set_module
    @module = "Driver"
  end

  #t.integer :bank_account_id
  #t.integer :vehicle_id
  #t.integer :store_id
  #t.integer :address_id
  #t.integer :segment_id
  #t.string :rut
  #t.string :email
  #t.string :password
  #t.string :first_name
  #t.string :last_name

  def provider_params
    params.require(:provider).permit!
  end
end
