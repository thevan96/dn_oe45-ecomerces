class OrdersController < ApplicationController
  before_action :require_logged_in, only: [:new]
  before_action :load_products_in_cart, only: [:new]
  before_action :load_total, only: [:new]

  def new; end

  def create
    ActiveRecord::Base.transaction do
      order = current_user.orders.create!(order_params)
      order_details = order.order_details.build load_order_details
      save_order_details order_details

      session[:cart] = {}
      redirect_to root_path, notice: t(".create_order_success")
    rescue ActiveRecord::RecordInvalid
      redirect_to new_order_path, error: t(".create_order_error")
    end
  end

  private

  def save_order_details order_details
    order_details.each do |order_detail|
      order_detail.save!
      order_detail.product.change_inventory "sub", order_detail.quantity
    end
  end

  def order_params
    return if params[:another_address].eql? "0"

    params.permit(:name_receive, :address_receive, :phone_recieve, :note)
  end

  def load_order_details
    session[:cart].map{|key, value| {product_id: key.to_i, quantity: value}}
  end

  def require_logged_in
    return if session[:user_id].present?

    store_location
    redirect_to sign_in_path, alert: t(".required_sign_in")
  end
end
