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

def sign_in(email = 'dave@test.com',
						password = 'password')
	visit '/login'
	fill_in 'email', with: email
	fill_in 'password', with: password
	click_button 'Login'
end