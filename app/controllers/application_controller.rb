class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :initialize_session

  def initialize_session
    session[:cart] ||= []
  end

  def list_carts
    @carts = Product.find(session[:cart])
  end
end
