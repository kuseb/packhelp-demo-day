FactoryBot.define do
	factory :user do
		email { Faker::Internet.email }
    password { Faker::Internet.password }
		password_confirmation { password }
		name { Faker::Name.name }
		nickname { name }
    role { 'client' }

    trait :client do
      role { 'client' }
		end
		
		trait :admin do
      role { 'admin' }
		end
		
		trait :salesman do
      role { 'salesman' }
    end
	end
end
