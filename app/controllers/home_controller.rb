class HomeController < ApplicationController
  def index
    list_carts()
    @products = Product.all.order(created_at: :desc)
  end

end
