require 'spec_helper'

feature "User browses all Peeps" do
	
	before(:each) {	Peep.create(post: "Lorem ipsum") }
	before(:each) {	Peep.create(post: "Dolor") }

	scenario "when opening the home page" do
		visit '/'
		expect(page).to have_content "Lorem ipsum"
		expect(page).to have_content "Dolor"
	end
end