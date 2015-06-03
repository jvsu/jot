class Group < ActiveRecord::Base
  belongs_to :note
  has_many :group_notes
end
