require 'spec_helper'
require 'rails_helper'

feature "New Note" do 
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
		within('#new_note') do 
			fill_in "collection[url]", :with=>"RgKAFK5djSk"
			fill_in "collection[name]", :with=>"WK-See You Again"
			click_button "Submit"
		end
	}

	scenario "Successful Note creation" do 
		within("#note") do 
			fill_in "note[start_timeh]", :with=>0
			fill_in "note[start_time1]", :with=>2
			fill_in "note[start_time2]", :with=>10
			fill_in "note[notes]", :with=>"Cool part here"
			click_button "Submit"
		end
		expect(page).to have_content("Cool part here")
	end


	scenario "Play Video of Note Just taken", :js=>true do 
		within("#note") do 
			fill_in "note[start_timeh]", :with=>0
			fill_in "note[start_time1]", :with=>1
			fill_in "note[start_time2]", :with=>10
			fill_in "note[notes]", :with=>"Cool part here"
			click_button "Submit"
		end
		click_on "Cool part here"

		# add has html/iframe here
	end

	scenario "Note View", :js=>true do
		within("#note") do 
			fill_in "note[start_timeh]", :with=>0
			fill_in "note[start_time1]", :with=>1
			fill_in "note[start_time2]", :with=>10
			fill_in "note[notes]", :with=>"Cool part here"
			click_button "Submit"
		end
		within(".note") do 
			click_on "Note View" 
		end
		expect(page).to have_content("Note View")
	end

end