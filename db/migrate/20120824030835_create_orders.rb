class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :card_type
      t.integer :card_number
      t.string :card_verification
      t.date :card_expiration_date

      t.timestamps
    end
  end
end
