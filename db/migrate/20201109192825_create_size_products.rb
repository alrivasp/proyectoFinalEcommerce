class CreateSizeProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :size_products do |t|
      t.string :name
      t.references :size_type, foreign_key: true

      t.timestamps
    end
  end
end
