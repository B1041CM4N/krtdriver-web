class ProductsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js, :html
  def index
    respond_to do |format|
      format.html {
        @products = Product.where(store_id: params[:store_id]).all.page params[:page]
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
    @product = Product.create(product_params)
    if @product.save
      flash[:success] = 'Producto creado correctamente!'
      redirect_to products_url
    else
      flash[:alert] = 'Error al intentar crear el producto'
      redirect_to @product
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
    redirect_to products_url
  end

  private

  def set_module
    @module = 'Product'
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
