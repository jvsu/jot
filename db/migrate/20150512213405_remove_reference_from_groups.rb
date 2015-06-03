class RemoveReferenceFromGroups < ActiveRecord::Migration
  def change
  	 remove_reference :groups, :note, index: true
  end
end
