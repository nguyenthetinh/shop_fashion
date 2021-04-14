class Suppliers::ProductsController < ApplicationController
  before_action :find_product, only: [:update, :edit]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(param_product)
    if @product.save
      flash[:success] = 'Product added!'
      redirect_to suppliers_products_path
    else
      flash[:alert] = 'Failed to create product!'  
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update!(param_product)
      flash[:success] = 'Product update ok!'
      redirect_to suppliers_products_path
    else
      flash[:alert] = "Failed to create product!"
      render :edit
    end
  end

  def find_product
    @product = Product.find_by id: params[:id]
  end

  def param_product
    params.require(:product).permit(:image, :name, :description, :price)
  end
end
