require 'rails_helper'

feature 'Farmer and Labourer management dashboard', :feature do
	let(:user) { FactoryGirl.create(:user, email: random_email) }
	let(:other_user) { FactoryGirl.create(:user, email: random_email) }
	let(:admin) { FactoryGirl.create(:user, :admin, email: random_email) }
	let(:farm_and_labour_path){"/organizations/#{admin.organizations.first.id}/farm_and_labour"}

	context "As an Admin" do 
		before do
			user.member_organizations << admin.organizations.first
			other_user.member_organizations << admin.organizations.second		
			login_as(admin)
		end

		scenario "Admin user should be able to enter farm_and_labour_path" do
			visit farm_and_labour_path
			expect(current_path).to eq farm_and_labour_path
		end
	end
end