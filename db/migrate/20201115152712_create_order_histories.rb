class CreateOrderHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :order_histories do |t|
      t.text :description
      t.references :order, foreign_key: true
      t.references :order_status, foreign_key: true

      t.timestamps
    end
  end
end
