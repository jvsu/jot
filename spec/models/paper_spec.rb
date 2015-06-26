require 'rails_helper'

RSpec.describe Paper, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "Should create a new paper if all inputs are correct" do 
  	paper =  Paper.new(user_id:1, thesis:'Go pro is the way to go', name:'Go Pro')
  	expect(paper).to be_valid
  end

  it "Should not create a new paper if user_id is missing" do
  	paper =  Paper.new(user_id:'', thesis:'Go pro is the way to go', name:'Go Pro')
  	expect(paper).to be_invalid
  end

  it "Should not create a new paper if name is missing" do
 	paper =  Paper.new(user_id:1, thesis:'Go pro is the way to go', name:'')
  	expect(paper).to be_invalid
  end

  it "Should not create a new paper if thesis is missing" do
  	paper =  Paper.new(user_id:1, thesis:'', name:'Go Pro')
  	expect(paper).to be_invalid
  
  end

  it "Should not create a new paper if all inputs are missing" do
  	paper =  Paper.new(user_id:'', thesis:'', name:'')
  	expect(paper).to be_invalid 
  end

end
