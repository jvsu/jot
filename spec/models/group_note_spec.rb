require 'rails_helper'

RSpec.describe GroupNote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "creates a new group_note if all inputs are correct" do 
  	gnote = GroupNote.new(user_id:1, group_id:1, note_id:1)
  	expect(gnote).to be_valid
  end

  it "does not create a new group_note if user_id is blank" do
  	gnote = GroupNote.new(user_id:'',group_id:1, note_id:1)
  	expect(gnote).to be_invalid
  end

  it "does not create a new group_note if group_id is blank" do
  	gnote = GroupNote.new(user_id:1, group_id:'',note_id:1)
  	expect(gnote).to be_invalid
  end

  it "does not create a new group_note if note_id is blank" do
  	gnote = GroupNote.new(user_id:1, group_id:1, note_id:'')
  	expect(gnote).to be_invalid
  end

  it "does not create a new group_note if all entries are blank" do
  	gnote = GroupNote.new(user_id:'',group_id:'', note_id:'')
  	expect(gnote).to be_invalid
  end

  it "does not create a new group_note if user_id is not a number" do
  	gnote = GroupNote.new(user_id:'a',group_id:1, note_id:1 )
  	expect(gnote).to be_invalid
  end

  it "does not create a new group_note if group_id is not a number" do
  	gnote = GroupNote.new(user_id:1, group_id:'a', note_id:1)
  	expect(gnote).to be_invalid

  end

  it "does not create a new group_note if note_id is not a number" do
  	gnote = GroupNote.new(user_id:1, group_id:1, note_id:'a')
  	expect(gnote).to be_invalid
  end

end
