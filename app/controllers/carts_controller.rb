class CartsController < ApplicationController
  before_action :init_cart
  before_action :product_correct, only: [:create, :destroy]

  def index
    @products = Product.load_cart(session[:cart].keys)
    @total = @products.reduce(0) do |sum, product|
      sum + product.price * session[:cart][product.id.to_s]
    end
  end

  def create
    id = params[:id]
    session[:cart][id] = 1 unless session[:cart].keys.include?(id)

    redirect_to product_path(id), notice: t(".add_success")
  end

  def destroy
    id = params[:id]
    session[:cart].delete(id)

    redirect_to carts_path, notice: t(".destroy_success")
  end

  private

  def product_correct
    product = Product.find_by id: params[:id].to_i
    return if product

    redirect_to root_path, alert: t(".product_not_valid")
  end

  def init_cart
    session[:cart] ||= {}
  end
end
