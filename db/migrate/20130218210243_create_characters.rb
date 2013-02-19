class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.string :elevator
      t.integer :project_id

      t.timestamps
    end
  end
end
