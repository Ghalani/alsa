FactoryGirl.define do
	factory :user do
		fname "Test"
		lname "name"
		email "foo#{Random.rand(1000..9999)}@example.com"
		password "password"
		#role "admin"

		trait :admin do
  		role "admin"
  		organizations { build_list :organization, 3 }
    end

	end

	factory :organization do
		name "org#{Random.rand(1000..9999)}"

	end
end