class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.references :order, index: true
      t.string :full_name
      t.string :email

      t.timestamps
    end
  end
end
