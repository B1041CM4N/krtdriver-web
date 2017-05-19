class ProductsController < ApplicationController
  before_action :authenticate_user!
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:success] = "Producto creado correctamente!"
      redirect_to :back
    else
      flash[:alert] = "Error al intentar crear el producto"
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
      flash[:success] = "Producto modificado exitosamente!"
      redirect_to :back
    else
      flash[:alert] = "Error al tratar de modificar el producto"
      redirect_to @product
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
