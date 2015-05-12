class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true
      t.integer :start_time
      t.text :notes
      t.string :url
      t.references :collection, index: true

      t.timestamps
    end
  end
end
