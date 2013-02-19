class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.string :body
      t.string :notes
      t.integer :project_id

      t.timestamps
    end
  end
end
