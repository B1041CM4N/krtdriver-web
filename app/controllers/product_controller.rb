class ProductController < ApplicationController
  before_action :authenticate_user!
  before_action :set_module
  respond_to :js, :html
  def index
    respond_to do |format|
      format.html {
        @products = Product.all.order(id: :asc).page params[:page]
        # @products = Product.where(store_id: params[:store_id]).all.page params[:page]
      }
      format.xlsx {
        @products = Product.where(store_id: params[:store_id]).all
      }
    end
  end

  def new
    @product = Product.new
  end

  def create
    Rails.logger.info 'PARAMS::::: ' + params.inspect + ' *********************'
    Rails.logger.info 'usuario loggeado: ' + current_user.inspect + " **********"
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Producto creado correctamente!'
      redirect_to root_url
    else
      flash[:alert] = 'Error al intentar crear el producto'
      @products = Product.all.page
      render :index
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = 'Producto modificado exitosamente!'
      redirect_to root_url
    else
      flash[:alert] = 'Error al tratar de modificar el producto'
      redirect_to @product
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def root_url
    product_index_url
  end

  def set_module
    @module = 'product'
  end

  def product_params
    # params.require(:product).permit(:name, :description, :price, :image, :store_id)
    params.require(:product).permit!
  end
end
