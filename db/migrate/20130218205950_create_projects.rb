class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :elevator
      t.string :skeleton
      t.string :notes

      t.timestamps
    end
  end
end
