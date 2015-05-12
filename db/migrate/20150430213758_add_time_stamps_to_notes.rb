class AddTimeStampsToNotes < ActiveRecord::Migration
  def change
  	  add_column :notes, :time_stamp_h, :integer
  	  add_column :notes, :time_stamp_m, :integer
  	  add_column :notes, :time_stamp_s, :integer
  end
end
