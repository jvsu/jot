class Collection < ActiveRecord::Base
  belongs_to :user
  validates :name, :user_id, :url, presence:true

  def a_method_used_for_validation_purposes
  	errors.add(:name, "Cannot be Blank")
  	errors.add(:url,"Cannot be Blank")
  end

end

