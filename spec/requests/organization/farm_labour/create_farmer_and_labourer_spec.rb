require 'rails_helper'

feature 'Access to farmer profile', :feature do
	let(:user) { FactoryGirl.create(:user, email: random_email) }
	let(:other_user) { FactoryGirl.create(:user, email: random_email) }
	let(:admin) { FactoryGirl.create(:user, :admin, email: random_email) }
	let(:new_farmer_path){"/organizations/#{admin.organizations.first.id}/farmers/new"}

	before do
		user.member_organizations << admin.organizations.first
		other_user.member_organizations << admin.organizations.second		
	end

	context "As an Admin" do 
		before do	
			login_as(admin)
			visit new_farmer_path
		end

		scenario "Admin user should be able to enter new Farmer create page" do
			expect(current_path).to eq new_farmer_path
		end

		scenario "User should be able to create new Farmer" do
			expect(current_path).to eq new_farmer_path
		end


	end

	context "As a Non-member" do 
		before do	
			login_as(other_user)
		end

		scenario "User not should be able to enter new Farmer create page" do
			visit new_farmer_path
			expect(current_path).not_to eq new_farmer_path
		end
	end
end