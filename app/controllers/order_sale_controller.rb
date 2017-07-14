class OrderSaleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_module
  
  def index
    unless (params[:order_status].present? || params[:date].present?)
      @order_sale = OrderSale.new
      # @order_sales = OrderSale.where(store_id: params[:store_id]).order(date: :desc).page params[:page]
      @order_sales = OrderSale.all.order(date: :desc).page params[:page]
    else
      @order_sale = OrderSale.new
      if (params[:order_status].present? && !params[:date].present?)
        # @order_sales = OrderSale.where('ordersale.store_id = ? AND ordersale.order_status = ?', params[:store_id], order_statuses_integer(params[:order_status]))
        @order_sales = OrderSale.where('ordersale.order_status = ?', order_statuses_integer(params[:order_status]))
      else
        @order_sales = OrderSale.where('ordersale.store_id = ? AND ordersale.order_status = ? AND ordersale.date <= ?', params[:store_id], order_statuses_integer(params[:order_status]), params[:date])
      end
    end
    respond_to do |format|
      format.html {
        @order_sales.order(order_id: :asc).page params[:page]
      }
      format.xlsx {
        @order_sales.order(order_id: :asc)
      }
    end
  end

  # enum order_status: [:pending, :rejected, :in_route, :deliver]

  def order_statuses_integer(opt)
    if opt == 'pending'
      osi = 0
    elsif opt == 'rejected'
      osi = 1
    elsif opt == 'in_route'
      osi = 2
    elsif opt == 'deliver'
      osi = 3
    end
    osi
  end

  def order_cancellation
    order_sale = OrderSale.find(params[:id])
    order_sale.update_attributes(order_status: 1)
    redirect_to root_url
  end

  private

  def root_url
    store_order_sale_index_url(params[:store_id])
  end

  def set_module
    @module = 'order_sale'
  end
end
