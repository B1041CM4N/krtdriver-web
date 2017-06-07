class DriversController < ApplicationController
  before_action :authenticate_user!

  respond_to :js, :html

  def index
    @drivers = Driver.all.order(id: :asc).page params[:page]
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      flash[:success] = 'Conductor creado exitosamente!'
      redirect_to drivers_url
    else
      flash[:alert] = 'Ha ocurrido un problema al intentar crear al conductor'
      render :new
    end
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update(driver_params)
      flash[:success] = 'Conductor modificado exitosamente'
      redirect_to drivers_url
    else
      flash[:alert] = 'Ha ocurrido un problema al tratar de modificar al conductor'
      render :edit
    end
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def destroy
    @driver = Driver.find(params[:id])
    if @driver.destroy
      flash[:success] = 'Conductor eliminado exitosamente!'
    end
    redirect_to drivers_url
  end

  private

  def driver_params
    params.require(:driver).permit(:first_name, :last_name, :rut, :nickname, :contact_number, :email, :web, :sector)
  end
end
