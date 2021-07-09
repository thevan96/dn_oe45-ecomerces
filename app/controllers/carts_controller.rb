class CartsController < ApplicationController
  before_action :product_correct, only: [:create, :destroy, :update]
  before_action :load_products_in_cart, only: [:index, :update]
  before_action :load_total, only: [:index, :update]

  def index; end

  def create
    @id = params[:id]
    session[:cart][@id] = 1 unless product_in_cart? @id
    flash.now[:notice] = t ".add_success"

    respond_to do |format|
      format.js
    end
  end

  def update
    id = params[:id]
    value = params[:value].to_i
    return if value <= 0

    session[:cart][id] = value if product_in_cart? id
    total_item = @product.price * session[:cart][id]

    respond_to do |format|
      format.json do
        render json: {
          amount: amount_product,
          total_item: total_item,
          total: @total
        }
      end
    end
  end

  def destroy
    @id = params[:id]
    session[:cart].delete(@id)

    respond_to do |format|
      format.js
    end
  end

  private

  def product_correct
    @product = Product.find_by id: params[:id].to_i
    return if @product

    redirect_to root_path, alert: t(".product_not_valid")
  end
end
