require 'google_drive'

class ProductController < ApplicationController
  before_action :authenticate_user!
  before_action :set_module
  respond_to :js, :html
  
  def index
    store = Store.find(params[:store_id])
    @products = store.products
    respond_to do |format|
      format.html {
        @products.order(product_id: :asc)
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
    # session = GoogleDrive::Session.from_config('config.json')
    # respond_to do |format|
    if @product.save
      inventory = Inventory.create(product_id: @product.product_id, store_id: params[:store_id], quantity: params[:inventory][:quantity], price: params[:inventory][:price])
      # if params[:product][:file_in_server].present?
        # Uploads a local file.
        # session.upload_from_file(Rails.root.to_s + "/public/#{@product.file_in_server.url}", @product.file_in_server.file.filename.to_s, convert: false)
        # @product.update_attributes(image: session[web_view_link].to_s)
        # @product.update_attributes(image: 'https://krtdriver-web.herokuapp.com' + @product.file_in_server.url.to_s)
      # end
      flash[:success] = 'Producto creado exitosamente'
      redirect_to root_url
    else
      @product
      flash[:alert] = "Ha ocurrido un error al tratar de crear el producto"
      @inventory = Inventory.new
      render :new
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
    if @product.update_attributes(product_params)
      inventory.update_attributes(price: params[:inventory][:price], quantity: params[:inventory][:quantity])
      flash[:success] = 'Producto modificado exitosamente!'
      redirect_to root_url
    else
      @product
      @inventory = Inventory.new
      flash[:alert] = 'Error al tratar de modificar el producto'
      render :edit
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
