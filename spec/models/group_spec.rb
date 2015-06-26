require 'rails_helper'

RSpec.describe Group, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new group if all inputs are correct" do 
  	group = Group.new(name:'fitness',user_id:1)
  	expect(group).to be_valid
  end

  it "does not create a new group if name is blank" do 
  	group = Group.new(name:'',user_id:1)
  	expect(group).to be_invalid
  end

  it "does not create a new group if user_id is blank" do
  	group = Group.new(name:"fitness",user_id:'')
  	expect(group).to be_invalid
  end

  it "does not create a new group if user_id is not a number" do
  	group = Group.new(name:'fitness',user_id:'a')
  	expect(group).to be_invalid
  end

  it "does not create a new group if all inputs are blank" do
  	 	group = Group.new(name:'',user_id:'')
  		expect(group).to be_invalid
  end

end
