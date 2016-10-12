require 'rails_helper'

feature 'Dashboard module list', :feature do
	let(:user) { FactoryGirl.create(:user) }

	describe "GET / " do
    it "should open successfully" do
    	login(user.email, user.password)
			expect(page).to have_content 'Invalid email or password.'
    end
  end

	# scenario 'user cannot sign in if not registered' do
	# 	login('person@example.com', 'password')
	# 	expect(page).to have_content 'Invalid email or password.'
	# end
end