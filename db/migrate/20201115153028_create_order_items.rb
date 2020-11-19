class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :quantity
      t.integer :price
      t.references :variant, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
