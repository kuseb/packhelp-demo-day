class OfferProduct < ApplicationRecord
  belongs_to :offer
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }

  def price
    product.unit_price * quantity
  end
end
