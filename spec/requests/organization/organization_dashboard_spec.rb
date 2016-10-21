require 'rails_helper'

feature 'Organization module dashboard', :feature do
	let(:admin) { FactoryGirl.create(:user, :admin, email:random_email) }
	let(:user) { FactoryGirl.create(:user, email:random_email) }
	let(:other_user) { FactoryGirl.create(:user, email:random_email) }
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
		expect(page).not_to have_content "New Organization"
	end
end