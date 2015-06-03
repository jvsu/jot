class GroupNote < ActiveRecord::Base
  belongs_to :note
  belongs_to :group
end
