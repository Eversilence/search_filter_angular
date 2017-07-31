class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string  :property_type
      t.string  :property_value
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
