class ProductController < ApplicationController
  before_action :authenticate_user!
  respond_to :js, :html
  def index
    respond_to do |format|
      format.html {
        @products = Product.where(Store_id: params[:Store_id]).all.page params[:page]
      }
      format.xlsx {
        @products = Product.where(Store_id: params[:Store_id]).all
      }
    end
  end

  def new
    @product = Product.new
  end

  def create
    Rails.logger.info "PARAMS::::: " + params.inspect + " *********************"
    @product = Product.new(product_params)
    @product.Store_id = params[:Store_id]
    @product.Category_id = params[:Category_id]
    if @product.save
      flash[:success] = 'Producto creado correctamente!'
      redirect_to product_index_url
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
      redirect_to :back
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

  def set_module
    @module = 'Product'
  end

  def product_params
    # params.require(:product).permit(:name, :description, :price, :image, :store_id)
    params.require(:product).permit!
  end
end
