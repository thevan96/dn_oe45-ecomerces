class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.boolean :active
      t.integer :role
      t.string :address

      t.timestamps
    end
  end
end
