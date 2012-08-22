class AddColumnQuantityToCartools < ActiveRecord::Migration
  def change
    add_column :cartools, :quantity, :integer
  end
end
