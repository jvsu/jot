class Paper < ActiveRecord::Base
  belongs_to :user
  has_many :points
  
end
