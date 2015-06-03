class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.references :note, index: true

      t.timestamps
    end
  end
end
