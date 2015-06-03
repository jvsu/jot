class Point < ActiveRecord::Base
  belongs_to :paper
  belongs_to :user
  has_many :pointsupports
end
