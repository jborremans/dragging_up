class AddToUserTool < ActiveRecord::Migration

  def change
  	add_column :users, :user_name, :string
  	add_column :users, :location, :string
  	add_column :users, :phone_number, :string
  	add_column :tools, :trade, :string
  	add_column :tools, :shipping_cost, :integer

  end

end
