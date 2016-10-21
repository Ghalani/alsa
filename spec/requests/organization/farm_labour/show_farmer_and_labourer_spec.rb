require 'rails_helper'

feature 'Access to farmer profile', :feature do
	let(:user) { FactoryGirl.create(:user, email: random_email) }
	let(:other_user) { FactoryGirl.create(:user, email: random_email) }
	let(:admin) { FactoryGirl.create(:user, :admin, email: random_email) }
	let(:farmer_path){"/organizations/#{admin.organizations.first.id}/farmers/#{admin.organizations.first.farmers.first.id}"}
	let(:labourer_path){"/organizations/#{admin.organizations.first.id}/labourers/#{admin.organizations.first.labourers.first.id}"}

	before do
		user.member_organizations << admin.organizations.first
		other_user.member_organizations << admin.organizations.second		
	end

	context "As an Admin" do 
		before do	
			login_as(admin)
		end

		scenario "I should be able to enter Farmer's page" do
			visit farmer_path
			expect(current_path).to eq farmer_path
		end

		scenario "I should be able to enter labourers's page" do
			visit labourer_path
			expect(current_path).to eq labourer_path
		end
	end

	context "As a Non-member" do 
		before do	
			login_as(other_user)
		end

		scenario "I should be able to enter Farmer's page" do
			visit farmer_path
			expect(current_path).not_to eq farmer_path
		end

		scenario "I should not be able to enter labourers's page" do
			visit labourer_path
			expect(current_path).not_to eq labourer_path
		end
	end
end