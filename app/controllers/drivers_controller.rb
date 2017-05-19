class DriversController < ApplicationController
  before_action :authenticate_user!
  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      flash[:success] = 'Conductor creado exitosamente!'
      redirect_to :back
    else
      flash[:alert] = 'Ha ocurrido un problema al intentar crear al conductor'
      redirect_to @driver
    end
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    @driver = Driver.find(params[:id])
    if @driver.update(driver_params)
      flash[:success] = 'Conductor modificado exitosamente'
      render :index
    else
      flash[:alert] = 'Ha ocurrido un problema al tratar de modificar al conductor'
      redirect_to @driver
    end
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def destroy
    @driver = Driver.find(params[:id])
    if @driver.destroy
      flash[:success] = 'Conductor eliminado exitosamente!'
    else
      flash[:alert] = 'Ocurrió un problema al tratar de eliminar al conductor'
    end
    redirect_to @driver
  end

  private

  def driver_params
    params.require(:driver).permit(:first_name, :last_name, :rut, :nickname, :contact_number, :email, :web, :sector)
  end
end
