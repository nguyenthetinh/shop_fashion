class Suppliers::ProductsController < ApplicationController
  before_action :find_product, only: [:update, :edit, :destroy]

  def index
    @products = current_supplier.products.all.order(created_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_supplier.products.build(param_product)

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
  
  def destroy
    @product.destroy!
    flash[:success] = 'delete success'
    redirect_to suppliers_products_path
  end

  def find_product
    @product = Product.find_by id: params[:id]
  end

  def param_product
    params.require(:product).permit(:image, :name, :description, :price)
  end
end
