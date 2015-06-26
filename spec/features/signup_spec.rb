require 'spec_helper'
require 'rails_helper'

feature "SignUp" do 
	scenario "Successful SignUp" do 
		visit '/sessions/index'
		within('#sign_up_input') do 
			fill_in "user[user_name]", :with=>'cray'
			fill_in "user[first_name]", :with=>'joe'
			fill_in "user[last_name]", :with=>'west'
			fill_in "user[email]", :with=>'cray_joe@yahoo.com'
			fill_in "user[password]", :with=>'aaaaaaaa'
		end
		within('#sign_up') do 
			click_button 'Submit'
		end
		expect(page).to have_content('New Note')
	end

	scenario "blank submit" do 
		visit '/sessions/index'
		within('#sign_up_input') do 
			fill_in "user[user_name]", :with=>''
			fill_in "user[first_name]", :with=>''
			fill_in "user[last_name]", :with=>''
			fill_in "user[email]", :with=>''
			fill_in "user[password]", :with=>''
		end
		within('#sign_up') do 
			click_button 'Submit'
		end
		expect(page).to have_content("can't be blank")
	end

	background do 
		User.new(first_name:'joseph', last_name:'su', user_name:'jvsu',email:'joe@yahoo.com', password:'aaaaaaaa').save
	end

	scenario "email aleady exists" do 
		visit '/sessions/index'
		within('#sign_up_input') do 
			fill_in "user[user_name]", :with=>'cray'
			fill_in "user[first_name]", :with=>'joe'
			fill_in "user[last_name]", :with=>'west'
			fill_in "user[email]", :with=>'joe@yahoo.com'
			fill_in "user[password]", :with=>'bbbbbbb'
		end
		within('#sign_up') do 
			click_button 'Submit'
		end
		expect(page).to have_content('Email has already been taken')
	end

	scenario "Successful SignUp" do 
		visit '/sessions/index'
		within('#sign_up_input') do 
			fill_in "user[user_name]", :with=>'cray'
			fill_in "user[first_name]", :with=>'joe'
			fill_in "user[last_name]", :with=>'west'
			fill_in "user[email]", :with=>'cray_joe@yahoo.com'
			fill_in "user[password]", :with=>'aaaaaaaa'
		end
		within('#sign_up') do 
			click_button 'Submit'
		end
		expect(page).to have_content('New Note')
	end


	scenario "Improper Email" do 
		visit '/sessions/index'
		within('#sign_up_input') do 
			fill_in "user[user_name]", :with=>'cray'
			fill_in "user[first_name]", :with=>'joe'
			fill_in "user[last_name]", :with=>'west'
			fill_in "user[email]", :with=>'cray_joe'
			fill_in "user[password]", :with=>'aaaaaaaa'
		end
		within('#sign_up') do 
			click_button 'Submit'
		end
		expect(page).to have_content('Email is invalid')
	end
end