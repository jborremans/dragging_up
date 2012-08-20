class CreateCartools < ActiveRecord::Migration
  def change
    create_table :cartools do |t|
      t.integer :tool_id
      t.integer :cart_id

      t.timestamps
    end
  end
end
