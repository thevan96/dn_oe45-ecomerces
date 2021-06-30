class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :users, through: :ratings
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  scope :newest, ->{order created_at: :desc}
end
