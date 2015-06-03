class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :name
      t.text :thesis
      t.references :user, index: true

      t.timestamps
    end
  end
end
