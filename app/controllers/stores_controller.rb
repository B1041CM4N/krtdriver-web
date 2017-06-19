class StoresController < ApplicationController
  before_action :authenticate_user!
  def index
    @stores = Store.all.order(id: :asc).page params[:page]
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      flash[:success] = "Tienda creada exitosamente"
      redirect_to root_url
    else
      flash[:alert] = "Ha ocurrido un problema al tratar de crear la tienda"
      render :new
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    @store.update_attributes(store_params)
    if @store.save
      flash[:success] = "Tienda actualizada exitosamente"
      redirect_to root_url
    else
      flash[:alert] = "Ha ocurrido un problema al tratar de modificar la tienda"
      render :edit
    end
  end

  def destroy
    @store = Store.find(params[:id])
    if @store.destroy
      flash[:success] = "Tienda eliminada exitosamente"
      redirect_to root_url
    end
  end

  private

  def set_module
    @module = "Store"
  end

  def store_params
    params.require(:store).permit(:name, :address, :phone)
  end
end
