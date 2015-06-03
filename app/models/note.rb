class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :collection
  has_many :group_notes
  has_many :point_supports
end
