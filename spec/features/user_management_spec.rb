require 'spec_helper'

feature "User signs up" do
	
	scenario "when user signs up" do
		expect{ sign_up }.to change(User, :count).by 1
		expect(User.first.email).to eq "dave@test.com"
	end

	def sign_up(username = 'dave',
							email = 'dave@test.com',
							password = 'password')
		visit '/sign-up'
		expect(page.status_code).to eq 200
		fill_in :username, with: username
		fill_in :email, with: email
		fill_in :password, with: password
		click_button "Sign up"
	end
end

feature "User signs in" do

	before(:each) do
		User.create(username: 'dave',
								email: 'test@test.com',
								password: 'oranges')
	end
		
		scenario "with correct credentials" do
			visit '/'
			expect(page).not_to have_content 'Hey Dave'
			sign_in('test@test.com', 'oranges')
			expect(page).to have_content 'Hey Dave' 
		end

		def sign_in(email, password)
			visit '/login'
			fill_in 'email', with: email
			fill_in 'password', with: password
			click_button 'Login'
		end

end