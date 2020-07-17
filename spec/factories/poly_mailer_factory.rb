FactoryBot.define do
  factory :poly_mailer do
    minimum_quantity 50
    maximum_quantity 100
    product_attributes { { width: 100, height: 100, material: 'black' } }
  end
end