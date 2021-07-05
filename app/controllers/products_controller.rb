class ProductsController < ApplicationController
  before_action :load_product, only: [:show]

  def index
    @products = Product.newest.paginate(
      page: params[:page],
      per_page: Settings.products.paginate.per_page
    )
  end

  def show; end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product

    render file: Rails.root.join("public", "404.html"), layout: false, status:
      :not_found
  end
end
