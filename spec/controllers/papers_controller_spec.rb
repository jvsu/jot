require 'rails_helper'

RSpec.describe PapersController, type: :controller do

  describe "GET #index" do
    before(:example){
      User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }

    before(:example){
      session[:user_id]= 1
    }
    before(:example){
      Paper.new(user_id:1, thesis:'Go pro is the way to go', name:'Go Pro').save
    }
    let(:user){
      @user = User.find(1)
    }
    let(:paper){
      @papers = Paper.all.where(user_id:1)
    }

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns current user info to @user" do 
      get :index
      expect(assigns['user']).to eq(user)
    end

    it "assigns all of the user's paper to @paper" do 
      get :index
      expect(assigns['papers']).to eq(paper)
    end
  end

  describe "GET #new" do
    before(:example){
      User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
    before(:example){
      session[:user_id] =1
    }
    before(:example){
       Paper.new(user_id:1, thesis:'Go pro is the way to go', name:'Go Pro').save
    }
    before(:example){
      Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
    }
    before(:example){
      Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:1)
    }
    before(:example){
      PointSupport.new(user_id:1, note_id:1, point_id:1)
    }
    let(:user){
      @user = User.find(1)
    }
    let(:paper){
      @paper = Paper.find(1)
    }
    let(:notes){
      @notes = Note.all.where(user_id:1, paper_id:1)
    }
    let(:points){
      @point = Point.all.where(paper_id:1)
    }
    let(:supports){
      @supports = PointSupport.all.where(user_id:1)
    }

    it "returns http success" do
      get(:new, :paper_id=>1)
      expect(response).to have_http_status(:success)
    end

    it "assigns current user information to @user" do 
      get(:new, :paper_id=>1)
      expect(assigns['user']).to eq(user)
    end

    it "assigns all the user papers to @paper" do 
      get(:new, :paper_id=>1)
       expect(assigns['paper']).to eq(paper)
    end

    it "assigns all the user notes to @note" do 
      get(:new, :paper_id=>1)
      expect(assigns['notes']).to eq(notes)
    end


    it "assigns all the user notes to @note" do 
      get(:new, :paper_id=>1)
      expect(assigns['points']).to eq(points)
    end

    it "assigns all the user notes to @note" do 
      get(:new, :paper_id=>1)
      expect(assigns['supports']).to eq(supports)
    end


  end

  describe "Ajax POST #create" do
    before(:example){
       Paper.new(user_id:1, thesis:'Go pro is the way to go', name:'Go Pro').save
    }

    it "returns http success" do
       xhr :post, :edit, :paper=>{:user_id=>1, :thesis=>'Hello there is cool', :name=>"Hello", :paper_id=>1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "Ajax POST #edit" do
    it "returns http success" do
      xhr :post, :create, :paper=>{user_id:1, thesis:"Hello", name:"Hello World"}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
      before(:example){
       Paper.new(user_id:1, thesis:'Go pro is the way to go', name:'Go Pro').save
     }

    it "returns http success" do
      get(:delete, :paper_id=>1)
      expect(response).to have_http_status(:found)
    end

    it "redirects to /papers/index" do 
       get(:delete, :paper_id=>1)
       expect(response).to redirect_to("/papers/index")
    end
  end



end
