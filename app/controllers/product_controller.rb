class ProductController < ApplicationController
  before_action :authenticate_user!
  before_action :set_module
  respond_to :js, :html
  
  def index
    store = Store.find(params[:store_id])
    @products = store.products
    respond_to do |format|
      format.html {
        # @products = Product.all.order(product_id: :asc).page params[:page]
        # @products.order(product_id: :asc).page(params[:page]).per(5)
        @products.order(product_id: :asc)
        # @products = Product.joins(:inventories).where(store_id: params[:store_id]).all.order(product_id: :asc).page params[:page]
      }
      format.xlsx {
        @products = @products.order(product_id: :asc)
      }
    end
  end

  def new
    @product = Product.new
    @inventory = @product.inventories.new
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        inventory = Inventory.create(product_id: @product.product_id, store_id: params[:store_id], quantity: params[:inventory][:quantity], price: params[:inventory][:price])
        format.html { redirect_to root_url, notice: 'La tienda ha sido creada exitosamente' }
        format.json { render :show, status: :created, location: @product }
      else
        @inventory = Inventory.new
        format.html { render :new }
        format.json { render :json, @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    @inventory = Inventory.find_by(product_id: @product.product_id)
  end

  def update
    @product = Product.find(params[:id])
    inventory = Inventory.find_by(product_id: @product.product_id)
    Rails.logger.info "inventario::::: " + inventory.inspect + " **************"
    if @product.update_attributes(product_params)
      inventory.update_attributes(price: params[:inventory][:price], quantity: params[:inventory][:quantity])
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
    redirect_to root_url
  end

  private

  def root_url
    store_product_index_url(params[:store_id])
  end

  def set_module
    @module = 'product'
  end

  def product_params
    # params.require(:product).permit(:name, :description, :price, :image, :store_id)
    params.require(:product).permit!
  end
end
