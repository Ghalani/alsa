require 'rails_helper'

RSpec.feature "User Authentiation" do
  context "signing in" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      goto_login_page
      login
    end

    scenario 'user should be signed in' do
      expect(page).to have_link 'Log out'
      expect(page).to_not have_link 'Log in'
    end

    scenario 'user should be able to access the dashboard' do
      goto_dashboard
      expect(current_path).to eq '/dashboard'
    end
  end 

  context "signed out" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      goto_login_page
      login
      click_link 'Log out'
    end

    scenario 'user should not be signed in' do
      expect(page).to have_link 'Log in'
      expect(page).to_not have_link 'Log Out'
    end

    scenario 'user should not be able to access the dashboard' do
      goto_dashboard
      expect(current_path).to_not eq '/dashboard'
      expect(page).to have_text 'Please sign in'
    end
  end
end