class Product < ApplicationRecord
  has_many :offer_products
  has_many :offers, throught: offer_products

  self.inheritance_column = :type
  validates :minimum_quantity, :maximum_quantity, presence: true
  validates_numericality_of :maximum_quantity, :greater_than => :minimum_quantity

  def self.types
    %w(mailer_box poly_mailer)
  end
end
