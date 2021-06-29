class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :products, through: :ratings
  has_many :orders, dependent: :destroy
end
