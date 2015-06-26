require 'rails_helper'

RSpec.describe Collection, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "Should not create a new collection if all inputs are blank" do 
  	collection = Collection.new(user_id:'',name:'', url:'')
  	expect(collection).to be_invalid
  end

  it "Should create a new collection if all inputs are correct" do
  	collection = Collection.new(user_id:1, name:"TedTalk", url:'fdsafdsafd')
  	expect(collection).to be_valid

  end

  it "Should not create a new collection if name is blank" do 
  	collection = Collection.new(user_id:1, name:"",url:"fdsafhkhja")
  	expect(collection).to be_invalid
  end

  it "Should not create a new collection if url is blank" do 
  	collection = Collection.new(user_id:1, name:'Weeds',url:'')
  	expect(collection).to be_invalid
  end

  it "Should not create a new collection if user_id is blank" do
  	collection = Collection.new(user_id:'', name:'Weeds', url:'vasdfjkh')
  	expect(collection).to be_invalid
  end

 it "Should not create a new collection if user_id is not a number" do
 	collection = Collection.new(user_id:'a', name:"weeds", url:'fhkjasldfhk')
 	expect(collection).to be_invalid
 end

end
