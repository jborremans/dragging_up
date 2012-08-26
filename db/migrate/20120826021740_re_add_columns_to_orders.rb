class ReAddColumnsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :card_type, :string
    add_column :orders, :card_expiration_date, :date  
 end 
end
