require 'rails_helper'

RSpec.describe PointSupport, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  	it "creates new point_support if all inputs are correct" do 
  		psupport = PointSupport.new(user_id:1, note_id:1, point_id:1)
  		expect(psupport).to be_valid
  	end

  	it "does not create a new point if all inputs are missing" do 
  		psupport = PointSupport.new(user_id:'', note_id:'', point_id:'')
  		expect(psupport).to be_invalid

  	end

  	it "does not craete a new point if user_id is missing" do
  		psupport = PointSupport.new(user_id:'', note_id:1, point_id:1)
  		expect(psupport).to be_invalid
  	end

  	it "does not craete a new point if point_id is missing" do
  		psupport = PointSupport.new(user_id:1, note_id:1, point_id:'')
  		expect(psupport).to be_invalid
  	end

  	it "does not craete a new point if note_id is missing" do
  		psupport = PointSupport.new(user_id:1, note_id:'', point_id:1)
  		expect(psupport).to be_invalid
  	end

  	it "does not craete a new point if user_id is not a number" do
  		psupport = PointSupport.new(user_id:'a', note_id:1, point_id:1)
  		expect(psupport).to be_invalid
  	end

  	it "does not craete a new point if point_id is not a number" do
  		psupport = PointSupport.new(user_id:1, note_id:1, point_id:'a')
  		expect(psupport).to be_invalid
  	end

  	it "does not craete a new point if note_id is not a number" do
  		psupport = PointSupport.new(user_id:1, note_id:'a', point_id:1)
  		expect(psupport).to be_invalid
  	end
end
