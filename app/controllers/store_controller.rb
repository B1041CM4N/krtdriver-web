class StoreController < ApplicationController
  before_action :authenticate_user!, :set_module

  def index
    @store = Store.new
    @stores = Store.all.order(id: :asc).page params[:page]
  end

  def new
    @store = Store.new
  end

  def create
    mcash = params[:efectivo]
    mdebit = params[:debito]
    mcredit = params[:credito]
    payment_method_id = set_payment_method(mcash, mdebit, mcredit)
    @store = Store.new(store_params)
    @store.paymentmethod_id = payment_method_id
    @store.user_id = current_user.user_id
    @store.bank_account_id = params[:bank_account_id]

    respond_to do |format|
      if @store.save
        format.html { redirect_to root_path, notice: 'La tienda ha sido creada exitosamente' }
        format.json { render :show, status: :created, location: @store }
      else
        format.html { render :new }
        format.json { render :json, @store.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_payment_method(mcash, mdebit, mcredit)
    if (mcash.present? && mdebit.present? && mcredit.present?)
      payment_method_id = 7
    elsif (mcash.present? && mdebit.present?)
      payment_method_id = 6
    elsif (mcash.present? && mdebit.present?)
      payment_method_id = 5
    elsif (mcash.present? && mcredit.present?)
      payment_method_id = 4
    elsif (mcash.present? && !mdebit.present? && !mcredit.present?)
      payment_method_id = 3
    elsif (!mcash.present? && mdebit.present? && !mcredit.present?)
      payment_method_id = 2
    else
      payment_method_id = 1
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
      flash[:error] = 'Ha ocurrido un problema al tratar de modificar la tienda'
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
    params.require(:store).permit(:store_id, :address_id, :paymentmethod_id,
    :bank_account_id, :name, :description, :efectivo, :debito, :credito)
  end
end
