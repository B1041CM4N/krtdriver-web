class OrderSaleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_module
  
  def index
    # @order_sales = OrderSale.all.order(order_id: :asc).page params[:page]
    @order_sales = OrderSale.where(store_id: params[:store_id]).order(order_id: :asc).page params[:page]
  end

  def order_cancellation
    order_sale = OrderSale.find(params[:id])
    order_sale.update(order_status: 3)
    redirect_to 
  end

  private

  def root_url
    store_order_sale_index_url(params[:store_id])
  end

  def set_module
    @module = 'order_sale'
  end
end
