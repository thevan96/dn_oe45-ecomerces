class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :ship_cost, default: 0
      t.string :status, default: "pending"
      t.string :method_payment, default: "cod"
      t.text :note
      t.string :name_receive
      t.string :phone_recieve
      t.string :address_receive

      t.timestamps
    end
  end
end
