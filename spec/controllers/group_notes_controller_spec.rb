require 'rails_helper'

RSpec.describe GroupNotesController, type: :controller do

  describe "Ajax request #create" do
    let(:success_hash){
      json_data = {message:"success", note_id:1,group_id:1,user_id:1, gn_id:1}
    }
    it "returns http success" do
      xhr :post, :create, :group_note=>{note_id:1, group_id:1, user_id:1}
      expect(response).to have_http_status(:success)
    end

  end

  describe "GET #delete" do
    before(:example){
        gnote = GroupNote.new(user_id:1, group_id:1, note_id:1).save
    }

    it "returns http Found" do
      post(:delete, :group_note=>{note_id:1,group_id:1, user_id:1, gnote:1, view:'true'})
      expect(response).to have_http_status(:found)
    end

    it "creates flash message if note removed from an http request" do 
      post(:delete, :group_note=>{note_id:1,group_id:1, user_id:1, gnote:1, view:'true'})
      expect(flash['message']).to eq("Note Removed")      
    end

    it "returns HTTP Success if it is an ajax request" do 
      xhr :post, :delete, :group_note=>{note_id:1,group_id:1, user_id:1, gnote:1, view:'false'}
      expect(response).to have_http_status(:success)
    end

  end


end
