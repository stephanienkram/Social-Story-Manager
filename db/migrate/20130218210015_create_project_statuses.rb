class CreateProjectStatuses < ActiveRecord::Migration
  def change
    create_table :project_statuses do |t|
      t.string :status
      t.integer :project_id

      t.timestamps
    end
  end
end
