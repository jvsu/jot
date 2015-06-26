require 'rails_helper'

RSpec.describe PointsController, type: :controller do

  

  describe "POST #create" do
    
    it "returns http success" do
      post(:create, :point=>{:description=>'fdsafs', :explanation=>'fasdfsda', :user_id=>1, :paper_id=>1})
      expect(response).to have_http_status(:found)
    end

    it "sets flash message 'Point Added' if point is successfully created" do 
      post(:create, :point=>{:description=>'fdsafs', :explanation=>'fasdfsda', :user_id=>1, :paper_id=>1})
      expect(flash['message']).to eq("Point Added")
    end

    it "redirects to /papers/new if point is succcessfully created" do 
      post(:create, :point=>{:description=>'fdsafs', :explanation=>'fasdfsda', :user_id=>1, :paper_id=>1})
      expect(response).to redirect_to("/papers/new/1")
    end

    it "sets error flash message if point is not created" do 
      post(:create, :point=>{:description=>'fdsafs', :explanation=>'', :user_id=>1, :paper_id=>1})
      expect(flash['message']).to eq('Error Please Resubmit')
    end

    it "redirects you to papers new if point is not created" do 
      post(:create, :point=>{:description=>'fdsafs', :explanation=>'', :user_id=>1, :paper_id=>1})
      expect(response).to redirect_to("/papers/new/1")
    end
  end

  describe "Ajax POST #edit" do 
    before(:example){
      User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
    before(:example){
       Paper.new(user_id:1, thesis:'Go pro is the way to go', name:'Go Pro').save
    }
    before(:example){
      Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:1)
    }
    it "returns http :success" do 
       xhr :post, :edit, :point=>{:description=>"fasdfdsa", :explanation=>"fdasfasd", :user_id=>1, :paper_id=>1}
       expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    # /points/delete/:point_id/:user_id/:paper_id'
    before(:example){
      User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
    before(:example){
       Paper.new(user_id:1, thesis:'Go pro is the way to go', name:'Go Pro').save
    }
    before(:example){
      Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:1).save
    }
    before(:example){
      session[:user_id] = 1
    }

    it "returns http success" do
      get(:delete, point_id:1, user_id:1, paper_id:1)
      expect(response).to have_http_status(:found)
    end

    it "sets flash success message if point is deleted" do 
       get(:delete, point_id:1, user_id:1, paper_id:1)
       expect(flash['message']).to eq("Point Deleted")
    end

    it "redirects to /papers/new if point is deleted" do  
      get(:delete, point_id:1, user_id:1, paper_id:1)
      expect(response).to redirect_to("/papers/new/1")
    end

    it "sets flash error message if point is not deleted" do 
      get(:delete, point_id:1, user_id:'', paper_id:1)
      expect(flash['message']).to eq("You don't have the priviledges to delete Point")
    end

    it "redirects to /papers/new if point is not deleted" do 
       get(:delete, point_id:1, user_id:'', paper_id:1)
       expect(response).to redirect_to("/papers/new/1")
    end


  end

end
