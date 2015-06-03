class AddColumnToGroupNote < ActiveRecord::Migration
  def change
  		add_reference :group_notes, :user, index: true
  end
end
