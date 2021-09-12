class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer :price_tax_included, null: false
      t.integer :quantity, null: false
      t.integer :making_status, null: false, default: "0"

      t.timestamps
    end
  end
end
