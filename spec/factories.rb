FactoryGirl.define do
	factory :user do
		fname "Test"
		lname "name"
		email "foo#{Random.rand(1000..9999)}@exam#{Random.rand(1000..9999)}ple.com"
		password "password"
		#role "admin"

		trait :admin do
  		role "admin"
  		organizations { build_list :organization, 3 }
    end

	end

	factory :organization do
		name "org#{Random.rand(1000..9999)}"
		farmers {build_list :farmer, 3}
	end

	factory :farmer do
		fname "Test"
		lname "name"
		phone	"#{Random.rand(1000..9999)}#{Random.rand(1000..9999)}"
		gender "female"
	end
end