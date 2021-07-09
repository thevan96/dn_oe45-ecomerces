class OrdersController < ApplicationController
  before_action :require_logged_in, only: [:new]
  before_action :load_info_cart, only: [:new]

  def new; end

  private

  def load_info_cart
    @products = Product.load_cart(session[:cart].keys)
    @total = @products.reduce(0) do |sum, product|
      sum + product.price * session[:cart][product.id.to_s]
    end
  end
end
