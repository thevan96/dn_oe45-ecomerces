class Category < ApplicationRecord
  belongs_to :parent, class_name: name, optional: true
  has_many :products, dependent: :destroy
  has_many :childrens,
           class_name: name,
           foreign_key: :parent_id,
           dependent: :destroy
end
