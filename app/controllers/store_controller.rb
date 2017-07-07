class StoreController < ApplicationController
  before_action :authenticate_user!
  def index
    @store = Store.new
    @stores = Store.all.order(id: :asc).page params[:page]
  end

  def new
    @store = Store.new
  end

  def create
    Rails.logger.info 'PARAMS: ' + params.inspect + ' **********'
    @store = Store.new(store_params)
    @store.user_id = current_user.id
    if @store.save
      flash[:success] = 'Tienda creada exitosamente'
      redirect_to root_path
    else
      Rails.logger.info 'STORE DATA:::: ' + @store.inspect + ' ****'
      flash[:alert] = 'Ha ocurrido un problema al tratar de crear la tienda'
      redirect_to action: :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(store_params)
      flash[:success] = 'Tienda actualizada exitosamente'
      redirect_to stores_url
    else
      flash[:alert] = 'Ha ocurrido un problema al tratar de modificar la tienda'
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
  end

  private

  def root_url
    stores_url
  end

  def set_module
    @module = 'Store'
  end

  def store_params
    params.require(:store).permit!
  end
end
