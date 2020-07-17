class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :minimum_quantity, null: false
      t.integer :maximum_quantity, null: false
      t.jsonb :product_attributes, default: '{}'
      t.string :type, null: false

      t.timestamps
    end
  end
end
