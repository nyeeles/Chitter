require 'spec_helper'
require_relative 'helpers/sessions'

feature "User posts new Peeps" do
	
	scenario 'when browsing the home page' do
		expect(Peep.count).to eq 0
		sign_up
		post_peep('My first Peep')
		expect(Peep.count).to eq 1
		expect(page).to have_content 'My first Peep'
	end

	def post_peep(post)
		within('#new-peep') do
			fill_in 'post', with: post
			click_button 'Peep'
		end
	end
end