class CreateProjectUpdates < ActiveRecord::Migration
  def change
    create_table :project_updates do |t|
      t.string :update
      t.integer :project_id

      t.timestamps
    end
  end
end
