class CartsController < ApplicationController

  def show
    list_carts()
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    @size = session[:cart].size
    render json: {size_cart: @size, success: "success"}
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    @size = session[:cart].size
    render json: { size_cart: @size, success: "success"}
  end


end
