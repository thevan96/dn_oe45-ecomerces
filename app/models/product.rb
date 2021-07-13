class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings, dependent: :destroy
  has_many :users, through: :ratings
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  scope :newest, ->{order created_at: :desc}
  scope :load_cart, ->(id){where id: id}

  def change_inventory type, value
    increment :inventory_count, value if type.eql? "add"

    if (type.eql? "sub") && (inventory_count - value >= 0)
      decrement :inventory_count, value
    end

    save!
  end
end
