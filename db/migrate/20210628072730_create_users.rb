class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :phone
      t.boolean :actived, default: false
      t.boolean :admin, default: false
      t.string :address

      t.timestamps
    end
  end
end
