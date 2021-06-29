class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :due_date
      t.text :note
      t.integer :status
      t.string :address
      t.string :phone
      t.string :receiver_name

      t.timestamps
    end
  end
end
