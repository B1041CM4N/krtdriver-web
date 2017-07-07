class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_module
  
  def index
  end

  private

  def set_module
    @module = "Home"
  end
end
