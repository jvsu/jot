class PointSupport < ActiveRecord::Base
  belongs_to :note
  belongs_to :point
  belongs_to :user
end
