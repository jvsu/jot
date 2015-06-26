require 'rails_helper'

RSpec.describe NoteSupportsController, type: :controller do

  describe "POST #create" do

    before(:example){
      Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:1)
    }

    before(:example){
      Group.new(name:'fitness',user_id:1)
    }


    it "returns http found" do
      post(:create, :support=>{user_id:1,note_id:1,point_id:1,group_id:1})
      expect(response).to have_http_status(:found)
    end

    it "creates flash message if successfully created" do 
      post(:create, :support=>{user_id:1,note_id:1,point_id:1,group_id:1})
      expect(flash['message']).to eq("Note Added")
    end


    it "redirects you after it is successfully created" do
      post(:create, :support=>{user_id:1,note_id:1,point_id:1,group_id:1})
      expect(response).to redirect_to("/notesupports/group/1/1")
    end

    it "creates flash message if not created" do
      post(:create, :support=>{user_id:1,note_id:'',point_id:1,group_id:1})
      expect(flash['message']).to eq('Not Added')
    end

    it "redirects you if it's not successfully created" do
      post(:create, :support=>{user_id:1,note_id:'',point_id:1,group_id:1})
        expect(response).to redirect_to("/notesupports/group/1/1")
    end
  end

  describe "GET #all_groups" do 

    before(:example){
      User.new(first_name:'joseph', last_name:'su', user_name:'jvsu',email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
    before(:example){
       Group.new(name:'fitness',user_id:1).save
    }
    before(:example){
      Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:1).save
    }
    before(:example){
      session[:user_id]=1
    }
    let(:user){
      @user = User.find(1)
    }
    let(:groups){
      @groups = Group.all.where(:user_id=>1)
    }
    let(:point){
      @point = Point.find(1)
    }
  

    it "Returns http status :success" do
      get(:all_groups,point_id:1)
      expect(response).to have_http_status(:success)
    end

    it "assigns current user information to @user" do 
        get(:all_groups,point_id:1)
        expect(assigns['user']).to eq(user)
    end

    it "assigns all the user groups to @groups" do
       get(:all_groups,point_id:1)
       expect(assigns['groups']).to eq(groups)
    end

    it "assigns point id you are working with to @point_id" do 
        get(:all_groups,point_id:1)
        expect(assigns['point_id']).to eq('1')  
    end

    it "assigns all the point information to @point" do 
      get(:all_groups,point_id:1)
      expect(assigns['point']).to eq(point)
    end
  end

  describe "GET #group" do 
     before(:example){
      User.new(first_name:'joseph', last_name:'su', user_name:'jvsu',email:'joe@yahoo.com', password:'aaaaaaaa').save
    }

    before(:example){
       Group.new(name:'fitness',user_id:1).save
    }

     before(:example){
      Point.new(description:"explains this",explanation:"this is why", paper_id:1, user_id:1).save
    }

    before(:example){
      GroupNote.new(user_id:1, group_id:1, note_id:1).save
    }
    before(:example){
      session[:user_id] =1
    }
    let(:user){
      @user = User.find(1)
    }
    let(:group){
      @group = Group.find(1)
    }
    let(:group_note){
      @group_notes = GroupNote.all.where(user_id:1, group_id:1)
    }


    it "returns http status success" do 
      get(:group,group_id:1,point_id:1)
      expect(response).to have_http_status(:success)
    end

    it "assigns current user to @user" do 
      get(:group,group_id:1,point_id:1)
      expect(assigns['user']).to eq(user)
    end

    it "assigns group information to @group" do 
        get(:group,group_id:1,point_id:1)
        expect(assigns['group']).to eq(group)
    end

    it "assigns all group notes that belong to the current user and group to @group_notes" do 
        get(:group,group_id:1,point_id:1)
        expect(assigns['group_notes']).to eq(group_note)
    end

    it "assigns info to  @point_id" do 
        get(:group,group_id:1,point_id:1)
        expect(assigns['point_id']).to eq('1')
    end
  end

end
