class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_save :update_current_price

  def total
    current_price * quantity
  end

  private

  def update_current_price
    self.current_price = product.price
  end
end
