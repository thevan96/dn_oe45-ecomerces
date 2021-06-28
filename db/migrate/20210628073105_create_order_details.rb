class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :quantity
      t.integer :current_price

      t.timestamps
    end
  end
end
