require 'rails_helper'

RSpec.describe Point, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new point if all inputs are correct" do 
  	point = Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:1)
  	expect(point).to be_valid
  end

  it "does not create a new point if all inputs are missing" do
  		point = Point.new(description:'',explanation:'', paper_id:'', user_id:'')
  		expect(point).to be_invalid
  end

  it "does not create a new point if paper_id is missing" do
  		point = Point.new(description:"explains this",explanation:"this is why", paper_id:'', user_id:1)
  		expect(point).to be_invalid
  end

  it "does not create a new point if user_id is missing" do
  		point = Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:'')
  		expect(point).to be_invalid
  end

  it "does not create a new point if description is missing" do 
  		point = Point.new(description:"",explanation:"this is why", paper_id:1, user_id:1)
  		expect(point).to be_invalid
  end

  it "does not create a new point if explanation is missing" do
  		point = Point.new(description:"explains this",explanation:"", paper_id:1, user_id:1)
  		expect(point).to be_invalid
  end

  it "does not create a new point if paper_id is not a number" do
  		point = Point.new(description:"explains this",explanation:"this is why", paper_id:'a', user_id:1)
  		expect(point).to be_invalid
  end

  it "does not create a new point if user_id is not a number" do
  		point = Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:'a')
  		expect(point).to be_invalid
  end  
end
