class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  private

  def set_module
    @module = "Order"
  end
end
