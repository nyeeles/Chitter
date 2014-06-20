require 'spec_helper'

feature "User goes to sign in" do

	scenario "when user wants to sign up" do
		visit '/'
		click_link 'Sign up'
		expect(current_path).to eq '/sign-up'
	end

	scenario "when user wants to login" do
		visit '/'
		click_link 'Login'
		expect(current_path).to eq '/login'
	end

end