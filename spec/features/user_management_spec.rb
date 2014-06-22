require 'spec_helper'
require_relative 'helpers/sessions'

feature "User signs up" do
	
	scenario "when user signs up" do
		expect{ sign_up }.to change(User, :count).by 1
		expect(User.first.email).to eq "dave@test.com"
	end
end

feature "User signs in" do

	before(:each) do
		User.create(username: 'dave',
								email: 'test@test.com',
								password: 'oranges')
	end
		
	# scenario "with correct credentials" do
	# 	visit '/'
	# 	expect(page).not_to have_content 'Hi Dave!'
	# 	sign_in('test@test.com', 'oranges')
	# 	expect(page).to have_content 'Hi Dave!' 
	# end
end

feature "User signs out" do

	before(:each) do
		User.create(username: 'dave',
								email: 'test@test.com',
								password: 'oranges')
	end

	# scenario "while being signed out" do
	# 	sign_in('test@test.com', 'oranges')
	# 	click_button 'Logout'
	# 	expect(page).not_to have_content 'Hey Dave'
	# end
end