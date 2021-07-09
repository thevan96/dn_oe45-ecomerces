class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  has_many :products, through: :order_details

  enum status: {
    pending: "pending",
    approved: "approved",
    rejected: "rejected",
    cancel: "cancel",
    moving: "moving",
    done: "done"
  }

  enum method_payment: {
    cod: "cod",
    credit: "credit",
    debit: "debit",
    paypal: "paypal"
  }

  def total
    order_details.map do |order_item|
      order_item.valid? ? order_item.total : 0
    end.sum
  end
end
