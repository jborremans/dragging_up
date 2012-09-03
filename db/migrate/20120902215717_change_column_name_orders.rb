class ChangeColumnNameOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :card_expiration_date, :card_expires_on
  end

end
