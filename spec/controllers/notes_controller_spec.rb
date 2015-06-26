require 'rails_helper'

RSpec.describe NotesController, type: :controller do

  describe "GET #new" do
    before(:example){
      User.new(first_name:'joseph', last_name:'su',user_name:'jvsu', email:'joe@yahoo.com', password:'aaaaaaaa').save
    }

    before(:example){
       Collection.new(user_id:1, name:"TedTalk", url:'fdsafdsafd').save
    }
    before(:example){
      Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1)
    }
    before(:example){
      session[:user_id] = 1
    }
    let(:collection){
      @collection = Collection.find(1)
    }

    let(:existing_notes){
      @existing_notes = Note.all.where(:collection_id=>1)
    }
    let(:user){
      @user = User.find(1)
    }

    it "returns http success" do
      get(:new,:collection_id=>1)
      expect(response).to have_http_status(:success)
    end

    it "finds and assigns the requested collection to @collection" do 
      get(:new,:collection_id=>1)
      expect(assigns['collection']).to eq(collection)
    end

    it "assigns the current users information to @user" do 
      get(:new,:collection_id=>1)
      expect(assigns['user']).to eq(user)
    end

    it "assigns all notes that belong to the requested collection to @existing_notes" do 
       get(:new,:collection_id=>1)
       expect(assigns['existing_notes']).to eq(existing_notes)
    end

  end

  describe "Ajax POST #create" do
    it "returns http success" do
      xhr :post, :create, :note=>{:url=>"fdasfhk", :user_id=>1, :start_time1=>1,:start_time2=>1, :notes=>'hello there', :collection_id=>1, :start_timeh=>1}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #retrieve" do

    before(:example){
      Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1).save
    }
    let(:note){
      Note.find(1)
    }

    it "returns http success" do
      get(:retrieve,:notes_id=>1)
      expect(response).to have_http_status(:success)
    end

    it "Assigns note information to @note" do 
      get(:retrieve,:notes_id=>1)
      expect(assigns['note']).to eq(note)
    end
  end

  describe "Ajax post #update" do
    it "returns http success" do
      xhr :post, :create, :note=>{:note=>'fdsafs', :note_id=>1, :start_time1=>1, :start_time2=>1, :start_timeh=>1, :source=>'fdsafsda'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
     before(:example){
      Note.new(user_id:1,notes:'hello',url:'dfasfads', collection_id:1, start_time:1,time_stamp_h:1,time_stamp_m:1, time_stamp_s:1).save
    }
    it "returns http success" do
      get(:destroy,note_id:1, collection_id:1)
      expect(response).to have_http_status(:found)
    end
    it "redirects you after it is deleted" do 
       get(:destroy,note_id:1, collection_id:1)
       expect(response).to redirect_to("/notes/new/1")

    end

   end

end
