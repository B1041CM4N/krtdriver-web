class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_module
  
  def index
    if current_user.store.nil?
      redirect_to new_store_url
    end
  end

  private

  def set_module
    @module = 'home'
  end
end
