class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :tool_name
      t.string :tool_type
      t.integer :tool_price
      t.string :tool_condition
      t.text :tool_description
      t.string :tool_picture

      t.timestamps
    end
  end
end
