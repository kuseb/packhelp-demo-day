FactoryBot.define do
  factory :offer do
    status ''

    trait :accepted do
      status { 'accepted' }
    end
    
    trait :rejected do
      status { 'rejected' }
		end
  end
end