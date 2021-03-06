require 'rails_helper'

feature 'Dashboard module list', :feature do
	let(:user) { FactoryGirl.create(:user) }
	let(:admin) { FactoryGirl.create(:user, :admin) }

	scenario 'user should not see the admin panel on the main Dashboard' do
		login_as(user)
		expect(page).to have_content 'Dashboard'
		expect(page).to have_content 'Organizations you work'
		expect(page).not_to have_content 'Admin panel'
	end

	context "As an Admin" do 
		before do
			login_as(admin)
		end

		scenario 'Admin user should see the admin panel on the main Dashboard' do
			expect(page).to have_content 'Dashboard'
			expect(page).to have_content 'Organizations you work'
			expect(page).to have_content 'Admin panel'
		end

		it "Admin User can click user link" do
			click_link 'View users' 
			expect(current_path).to eq '/users'
		end

		it "User can go to Organization index / List" do
			click_link 'View all organizations' 
			expect(current_path).to eq '/organizations'
		end

		it "User can go to Organization show / dashboard" do
			visit organization_path(admin.organizations.first)
			expect(current_path).to eq organization_path(admin.organizations.first)
		end
	end
end