class GroupNote < ActiveRecord::Base
  belongs_to :note
  belongs_to :group
  validates :note_id, :group_id, :user_id, presence:true, numericality: true
  

end
