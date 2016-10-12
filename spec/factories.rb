FactoryGirl.define do
	factory :user do
		fname "Test"
		lname "name"
		email "foo#{Random.rand(1000..9999)}@example.com"
		password "password"
		#role "admin"

		trait :admin do
  		role "admin"
    end

	end
end