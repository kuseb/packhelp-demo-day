FactoryBot.define do
  factory :mailer_box do
    minimum_quantity 10
    maximum_quantity 100
    product_attributes { { width: 100, length: 100, height: 100 } }
  end
end