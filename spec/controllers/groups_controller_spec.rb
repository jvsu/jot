require 'rails_helper'

RSpec.describe GroupsController, type: :controller do

  

  describe "Ajax POST #create" do
    it "returns http success" do
      xhr :post, :create, :group=>{name:"Lifestyle",user_id:1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #view" do
    before(:example){
       User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }

    before(:example){
       Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1).save
    }

    before(:example){
      Group.new(name:"Lifestyle",user_id:1).save
    }

    before(:example){
      GroupNote.new(user_id:1, group_id:1, note_id:1).save
    }

    before(:example){
      session[:user_id]=1
    }
    let(:user){
      @user = User.find(1)
    }

    let(:group){
      @group = Group.find(1)
    }
    let(:group_notes){
      @group_notes = GroupNote.all.where(user_id:1,group_id:1)
    }

    it "returns http success" do
     get(:view,:group_id=>1)
      expect(response).to have_http_status(:success)
    end

    it "assigns current user information to @user" do 
      get(:view,:group_id=>1)
      expect(assigns["user"]).to eq(user)
    end

    it "assigns users group information to @group" do 
      get(:view,:group_id=>1)
      expect(assigns["group"]).to eq(group)
    end

    it "assigns all user's group notes to @group_notes" do 
      get(:view,:group_id=>1)
      expect(assigns["group_notes"]).to eq(group_notes)
    end
  end


  describe "GET #all" do
    before(:example){
       User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
    before(:example){
      session[:user_id] = 1
    }
  
  before(:example){
      Group.new(name:"Lifestyle",user_id:1).save
    }

    let(:user){
      @user = User.find(1)
    }
    let(:group){
      @group = Group.all.where(user_id:1)
    }

    it "returns http success" do
      get :all
      expect(response).to have_http_status(:success)
    end

    it "assigns the current user information to @user" do 
      get :all
      expect(assigns["user"]).to eq(user)
    end


    it "assigns all the user's groups to @group" do 
      get :all
      expect(assigns["groups"]).to eq(group)
    end
  end

  describe "GET #select" do
     before(:example){
       User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
    before(:example){
      session[:user_id] = 1
    }
  
  before(:example){
      Group.new(name:"Lifestyle",user_id:1).save
    }

    before(:example){
      Collection.new(user_id:1, name:"TedTalk", url:'fdsafdsafd')
    }

    before(:example){
      Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1).save
    }

    let(:user){
      @user = User.find(1)
    }
    let(:group){
      @group = Group.all.where(user_id:1)
    }
    let(:collection){
      @collection = Collection.all.where(user_id:1)
    }
    let(:notes){
      @notes = Note.all.where(user_id:1)
    }
    let(:group_id){
      @group_id = '1'
    }
    let(:group_notes){
      @group_notes = GroupNote.all.where(user_id:1, group_id:1)
    }


    it "returns http success" do
      get(:select,:group_id=>1)
      expect(response).to have_http_status(:success)
    end

    it "assigns current user to @user" do 
      get(:select,:group_id=>1)
      expect(assigns["user"]).to eq(user)
    end

    it "assigns all the current user's collection to @collections" do 
     get(:select,:group_id=>1)
     expect(assigns['collections']).to eq(collection)
    end

    it "it assigns all the current user's notes to @notes" do 
       get(:select,:group_id=>1)
       expect(assigns['notes']).to eq(notes)
    end


    it "it assigns requested group id to @group_id" do 
      get(:select,:group_id=>1)
      expect(assigns['group_id']).to eq(group_id)

    end

    it "assigns all the notes associated with the group to @group_notes" do 
       get(:select,:group_id=>1)
      expect(assigns['group_notes']).to eq(group_notes)
    end
  end

  describe "Get #delete" do 
    before(:example){
       User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }
    before(:example){
       Group.new(name:"Lifestyle",user_id:1).save
    }
    let(:success){
      flash[:message]= "Group Deleted"
    }
    let(:fail){
      flash[:message]="Group Not Deleted"
    }

    it "returns http found" do 
      get(:delete,group_id:1,user_id:1)
      expect(response).to have_http_status(:found)
    end

    it "sets flash message 'Group Deleted' if group is successfully deleted" do
       get(:delete,group_id:1,user_id:1)
       expect(flash['message']).to eq(success)
    end

    it "redirects to /groups/all if successful" do
      get(:delete,group_id:1,user_id:1)
      expect(response).to redirect_to("/groups/all")
    end

    it "sets flash message 'Group Not Deleted' if group not deleted" do 
       get(:delete,group_id:1,user_id:2)
       expect(flash['message']).to eq(fail)
    end 

    it "redirects to /groups/all if group is not deleted" do
       get(:delete,group_id:1,user_id:2)
       expect(response).to redirect_to("/groups/all")
    end
  end
end
