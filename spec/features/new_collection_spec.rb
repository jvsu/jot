require 'spec_helper'
require 'rails_helper'


feature "New collection" do 
	before(:each){
		User.new(first_name:'joseph', last_name:'su', user_name:'jvsu',email:'joe@yahoo.com', password:'aaaaaaaa').save	 
	}

	before(:each){
		visit '/sessions/index'
		within('#log_in_input') do 
			fill_in "user[email]", :with=>'joe@yahoo.com'
			fill_in "user[password]", :with=>"aaaaaaaa"
		end
		within('#login') do 
			click_button "Submit"
		end

	}
	
	scenario "successful creation", :js=>true do 
		within('#new_note') do 
			fill_in "collection[url]", :with=>"fsafhkhs"
			fill_in "collection[name]", :with=>"Lecture 1"
			click_button "Submit"
		end
		expect(page).to have_content('Lecture 1')
	end

	scenario "no url", :js=>true do
		within('#new_note') do 
			fill_in "collection[url]", :with=>""
			fill_in "collection[name]", :with=>"Lecture 1"
			click_button "Submit"
		end
		expect(page).to have_content('Error')
	end

	scenario "no name", :js=>true do 
		within('#new_note') do 
			fill_in "collection[url]", :with=>"fasdfads"
			fill_in "collection[name]", :with=>""
			click_button "Submit"
		end
		expect(page).to have_content('Error')
	end


	scenario "Blank Submit", :js=>true do 
		within('#new_note') do 
			fill_in "collection[url]", :with=>""
			fill_in "collection[name]", :with=>""
			click_button "Submit"
		end
		expect(page).to have_content('Error')
	end

end