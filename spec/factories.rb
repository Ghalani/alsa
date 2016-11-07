FactoryGirl.define do
	factory :user do
		fname "Test"
		lname "name"
		email "foo#{Random.rand(1000..9999)}@exam#{Random.rand(1000..9999)}ple.com"
		password "password"
		#role "admin"

		trait :admin do
  		organizations { build_list :organization, 3 }
  		#roles organizations.collect{ |org| org.roles.first } 
    end

	end

	factory :organization do
		name "org#{Random.rand(1000..9999)}"
		farmers {build_list :farmer, 3}
		roles {build_list :role, 1}
	end

	factory :farmer do
		fname "Test"
		lname "name"
		phone	"#{Random.rand(1000..9999)}#{Random.rand(1000..9999)}"
		gender "female"
	end

	factory :role do
		name "admin"		
	end
end