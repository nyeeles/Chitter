require 'spec_helper'

feature "User goes to sign in" do

	scenario "when browsing the home page" do
		visit '/'
		click_link 'Sign up'
		expect(current_path).to eq '/sign-up'
	end

end