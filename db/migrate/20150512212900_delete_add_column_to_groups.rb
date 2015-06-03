class DeleteAddColumnToGroups < ActiveRecord::Migration
  def change
  	remove_column :groups, :notes_id, :integer
  	add_reference :groups, :user, index: true
  end
end
