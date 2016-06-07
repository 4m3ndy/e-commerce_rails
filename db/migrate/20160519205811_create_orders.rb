class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_no
      t.float :total
      t.date :date
      t.references :customer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
