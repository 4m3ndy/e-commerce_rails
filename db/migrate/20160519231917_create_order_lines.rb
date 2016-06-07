class CreateOrderLines < ActiveRecord::Migration
  def change
    create_table :order_lines do |t|
      t.references :product, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.integer :qty
      t.float :unit_price
      t.float :total_price

      t.timestamps null: false
    end
  end
end
