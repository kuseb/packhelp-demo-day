class CreateOfferProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :offer_products do |t|
      t.integer :quantity, null: false
      t.timestamps
    end

    add_reference :offer_products, :offer, index: true, foreign_key: true
    add_reference :offer_products, :product, foreign_key: true
  end
end
