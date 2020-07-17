class Offer < ApplicationRecord
  belongs_to :user
  has_many :offer_products
  has_many :products, through: :offer_products

  validates :status, inclusion: { in:  [nil, 'accepted', 'rejected'] }
end
