class OrderSaleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_module
  
  def index
    @order_sales = OrderSale.all.order(order_id: :asc).page params[:page]
    # @order_sales = OrderSale.where(store_id: params[:store_id]).order(order_id: :asc).page params[:page]
  end

  private

  def set_module
    @module = 'ordersale'
  end
end
