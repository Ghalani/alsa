require 'rails_helper'

feature 'Organization module dashboard', :feature do
	let(:user) { FactoryGirl.build_stubbed(:user) }
	let(:other_user) { FactoryGirl.build_stubbed(:user) }
	let(:admin) { FactoryGirl.build_stubbed(:user, :admin) }
	before do
		user.member_organizations << admin.organizations.first
		other_user.member_organizations << admin.organizations.second		
	end

	scenario "Other user should not be able to enter non-member organization" do
		login_as(other_user)
		visit "/organizations/#{admin.organizations.first.id}"
		expect(current_path).not_to eq "/organizations/#{admin.organizations.first.id}"
	end

	scenario "User should be able to enter member organization" do
		login_as(user)
		visit "/organizations/#{admin.organizations.first.id}"
		expect(current_path).to eq "/organizations/#{admin.organizations.first.id}"
	end
end