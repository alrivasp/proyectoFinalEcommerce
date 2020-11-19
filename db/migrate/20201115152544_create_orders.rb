class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :number
      t.integer :total
      t.references :user, foreign_key: true
      t.references :order_type, foreign_key: true

      t.timestamps
    end
  end
end
