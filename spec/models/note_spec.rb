require 'rails_helper'

RSpec.describe Note, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it "Creates a new note if all inputs are correct" do
  	note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
  	expect(note).to be_valid
  end

  it "Does not create a new note if user_id is missing" do 
  	note = Note.new(user_id:'',notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
  	expect(note).to be_invalid
  end

	it "Does not create a new note if notes is missing" do
		note = Note.new(user_id:1,notes:'',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
  		expect(note).to be_invalid
	end


	it "Does not create a new note if url is missing" do
		note = Note.new(user_id:2,notes:'hello',url:'', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
  		expect(note).to be_invalid
	end

	it "Does not create a new note if collection_id is missing" do 
		note = Note.new(user_id:2,notes:'hello',url:'dfasfads', collection_id:'', start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
  		expect(note).to be_invalid
	end


	it "Does not create a new note if start_time is missing" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:'',time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
  		expect(note).to be_invalid
	end

	it "Does not create a new note if time_stamp_h is missing" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:'',time_stamp_m:1, time_stamp_s:1)
  		expect(note).to be_invalid
	end

	it "Does not create a new note if time_stamp_m is missing" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:'', time_stamp_s:1)
  		expect(note).to be_invalid
	end

	it "Does not create a new note if time_stamp_s is missing" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:'')
  		expect(note).to be_invalid
	end


	it "Does not create a new note if start_time is not a number" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:'a',time_stamp_h:1,time_stamp_m:'', time_stamp_s:1)
  		expect(note).to be_invalid
	end

	it "Does not create a new note if time_stamp_h is not a number" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:2,time_stamp_h:'a',time_stamp_m:'', time_stamp_s:1)
  		expect(note).to be_invalid
	end

	it "Does not create a new note if time_stamp_m is not a number" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:2,time_stamp_h:2,time_stamp_m:'', time_stamp_s:1)
  		expect(note).to be_invalid
	end

	it "Does not create a new note if time_stamp_s is not a number" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:2,time_stamp_h:2,time_stamp_m:2, time_stamp_s:'a')
  		expect(note).to be_invalid
	end


	it "Does not create a new note if user_id is not a number" do 
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:2,time_stamp_h:2,time_stamp_m:2, time_stamp_s:'a')
  		expect(note).to be_invalid
	end

	it "Does not create a new note if collection_id is not a number" do
		note = Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:'a', start_time:2,time_stamp_h:2,time_stamp_m:2, time_stamp_s:1)
  		expect(note).to be_invalid
	end











end
