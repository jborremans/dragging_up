class RemoveColumnsFromOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :card_number
    remove_column :orders, :card_verification
    remove_column :orders, :card_type
    remove_column :orders, :card_expiration_date
end
end
