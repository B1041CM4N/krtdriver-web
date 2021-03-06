class StoreController < ApplicationController
  before_action :authenticate_user!, :set_module

  def index
    @store = Store.new
    @stores = Store.all.order(id: :asc).page params[:page]
  end

  def new
    @store = Store.new
    @address = Address.new
    @bank_account = BankAccount.new
  end

  def create
    mcash = params[:efectivo]
    mdebit = params[:debito]
    mcredit = params[:credito]
    gmaps = GoogleMapsService::Client.new
    # Geocoding an address
    commune = Commune.find(params[:store][:address][:commune_id])
    results = gmaps.geocode(params[:store][:address][:street_name].to_s + ' ' + params[:store][:address][:street_number].to_s + ', ' + commune.name.to_s )
    if results.count.zero?
      latitude = ''
      longitude = ''
    else
      latitude = results.first[:geometry][:location][:lat]
      longitude = results.first[:geometry][:location][:lng]
    end
    
    @addresss = Address.new(commune_id: params[:store][:address][:commune_id],
    street_name: params[:store][:address][:street_name], street_number: params[:store][:address][:street_number],
    block_number: params[:store][:address][:block_number], town_name: params[:store][:address][:town_name],
    latitude: latitude.to_s, longitude: longitude.to_s)

    @bank_account = BankAccount.new(bank_id: params[:store][:bank_account][:bank_id], ta_id: params[:store][:bank_account][:ta_id],
    account_number: params[:store][:bank_account][:account_number], user_id: current_user.user_id)

    respond_to do |format|
      if @addresss.save
        if @bank_account.save
          @store = Store.new(address_id: @addresss.address_id, paymentmethod_id: payment_method_setter(mcash, mdebit, mcredit),
          bank_account_id: @bank_account.bank_account_id, name: params[:store][:name], description: params[:store][:description],
          user_id: current_user.user_id)
          if @store.save
            format.html { redirect_to root_path, notice: 'La tienda ha sido creada exitosamente' }
            format.json { render :show, status: :created, location: @store }
          else
            format.html { render :new }
            format.json { render :json, @store.errors, status: :unprocessable_entity }
          end
        else
          format.html { render :new }
          format.json { render :json, @bank_account.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render :json, @addresss.errors, status: :unprocessable_entity }
      end
    end
  end

  def payment_method_setter(mcash, mdebit, mcredit)
    if (mcash.present? && mdebit.present? && mcredit.present?)
      payment_method_id = 7
    elsif (mcash.present? && mdebit.present? && !mcredit.present?)
      payment_method_id = 6
    elsif (!mcash.present? && mcredit.present? && mdebit.present?)
      payment_method_id = 5
    elsif (mcash.present? && mcredit.present? && !mdebit.present?)
      payment_method_id = 4
    elsif (mcash.present? && !mdebit.present? && !mcredit.present?)
      payment_method_id = 3
    elsif (!mcash.present? && mdebit.present? && !mcredit.present?)
      payment_method_id = 2
    elsif(!mcash.present? && !mdebit.present? && mcredit.present?)
      payment_method_id = 1
    end
    payment_method_id.to_i
  end

  def edit
    @store = Store.find(params[:id])
    @address = Address.find(@store.address_id)
    @bank_account = @store.bank_account
  end

  def update
    @store = Store.find(params[:id])
    mcash = params[:efectivo]
    mdebit = params[:debito]
    mcredit = params[:credito]
    # INICIO GEOCODING
    gmaps = GoogleMapsService::Client.new
    # Geocoding an address
    commune = Commune.find(params[:store][:address][:commune_id])
    results = gmaps.geocode(params[:store][:address][:street_name].to_s + ' ' + params[:store][:address][:street_number].to_s + ', ' + commune.name.to_s )
    unless results.count.zero?
      latitude = results.first[:geometry][:location][:lat]
      longitude = results.first[:geometry][:location][:lng]
    else
      latitude = ''
      longitude = ''
    end
    # FIN GEOCODING
    @address = @store.address
    @bank_account = @store.bank_account

    respond_to do |format|
      if @address.update(commune_id: params[:store][:address][:commune_id],
      street_name: params[:store][:address][:street_name], street_number: params[:store][:address][:street_number],
      block_number: params[:store][:address][:block_number], town_name: params[:store][:address][:town_name],
      latitude: latitude.to_s, longitude: longitude.to_s)
        if @bank_account.update(bank_id: params[:store][:bank_account][:bank_id], ta_id: params[:store][:bank_account][:ta_id],
        account_number: params[:store][:bank_account][:account_number], user_id: current_user.user_id)
          if @store.update(address_id: @address.address_id, paymentmethod_id: payment_method_setter(mcash, mdebit, mcredit),
          bank_account_id: @bank_account.bank_account_id, name: params[:store][:name], description: params[:store][:description],
          user_id: current_user.user_id)
            format.html { redirect_to root_path, notice: 'La tienda ha sido actualizada exitosamente' }
            format.json { render :show, status: :created, location: @store }
          else
            format.html { redirect_to action: :edit }
            format.json { render :json, @store.errors, status: :unprocessable_entity }
          end
        else
          format.html { redirect_to action: :edit }
          format.json { render :json, @bank_account.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to action: :edit }
        format.json { render :json, @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    redirect_to root_url
  end

  private

  def root_url
    store_index_url
  end

  def set_module
    @module = 'store'
  end

  def store_params
    # params.require(:store).permit!
    params.require(:store).permit(:store_id, :address_id, :paymentmethod_id,
    :bank_account_id, :name, :description, :efectivo, :debito, :credito,
    :address => [:commune_id, :street_name, :street_number, :block_number,
    :town_name], :bank_account => [:bank_id, :ta_id, :account_number, :user_id])
  end

  # def address_params
  #   params.require(:address).permit(:commune_id, :street_name, :street_number, :block_number, :town_name)
  # end
   
  # def bank_account_params
  #   params.require(:bank_account).permit(:bank_id, :ta_id, :account_number, :user_id)
  # end
end
