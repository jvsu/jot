require 'spec_helper'
require 'rails_helper'

feature "Login" do 
	background do 
		User.new(first_name:'joseph', last_name:'su', user_name:'jvsu',email:'joe@yahoo.com', password:'aaaaaaaa').save
	end

	scenario "Successful Login" do 
		visit '/sessions/index'
		within('#log_in_input') do 
			fill_in "user[email]", :with=>'joe@yahoo.com'
			fill_in "user[password]", :with=>"aaaaaaaa"
		end
		within('#login') do 
			click_button "Submit"
		end
		expect(page).to have_content('New Note')
	end

	scenario "Blank Submit" do 
		visit "/sessions/index"
		within('#login') do 
			click_button "Submit"
		end
		expect(page).to have_content('Email or Password Not Correct')
	end

	scenario "No Email" do
		visit '/sessions/index'
		within('#log_in_input') do 
			fill_in "user[email]", :with=>''
			fill_in "user[password]", :with=>"aaaaaaaa"
		end
		within('#login') do 
			click_button "Submit"
		end
		expect(page).to have_content('Email or Password Not Correct')
	end

	scenario "Incorrect Password" do 
		visit '/sessions/index'
		within('#log_in_input') do 
			fill_in "user[email]", :with=>'joe@yahoo.com'
			fill_in "user[password]", :with=>"bbbbbb"
		end
		within('#login') do 
			click_button "Submit"
		end
		expect(page).to have_content('Email or Password Not Correct')
	end


end