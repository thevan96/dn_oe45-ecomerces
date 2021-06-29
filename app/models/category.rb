class Category < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :parent_id, class_name: name
  has_many :childrens,
           class_name: name,
           foreign_key: :parent_id,
           dependent: :destroy
end
