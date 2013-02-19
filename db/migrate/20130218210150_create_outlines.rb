class CreateOutlines < ActiveRecord::Migration
  def change
    create_table :outlines do |t|
      t.string :title
      t.integer :order
      t.string :description
      t.string :notes
      t.integer :project_id

      t.timestamps
    end
  end
end
