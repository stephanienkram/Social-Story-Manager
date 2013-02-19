class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :location
      t.integer :project_id

      t.timestamps
    end
  end
end
