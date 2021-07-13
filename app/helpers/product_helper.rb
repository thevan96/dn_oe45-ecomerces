module ProductHelper
  def product_empty product
    product.inventory_count.eql? 0
  end
end
