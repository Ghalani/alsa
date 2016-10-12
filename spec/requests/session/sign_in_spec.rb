require 'rails_helper'

feature 'Sign in', :feature do
	let(:user) { FactoryGirl.create(:user) }
	scenario 'user cannot sign in if not registered' do
		login('person@example.com', 'password')
		expect(page).to have_content 'Invalid email or password.'
	end

	scenario 'user can sign in with valid credentials' do
		#user = FactoryGirl.create(:user)
		login(user.email, user.password)
		expect(page).to have_content 'Signed in successfully.'
	end

	scenario 'user cannot sign in with wrong email' do
    #user = FactoryGirl.create(:user)
    login('invalid@email.com', user.password)
    expect(page).to have_content 'Invalid email or password.'
  end

  scenario 'user cannot sign in with wrong password' do
    #user = FactoryGirl.create(:user)
    login(user.email, 'invalidpass')
    expect(page).to have_content 'Invalid email or password.'
  end
end