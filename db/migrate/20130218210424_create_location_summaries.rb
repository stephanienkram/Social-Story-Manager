class CreateLocationSummaries < ActiveRecord::Migration
  def change
    create_table :location_summaries do |t|
      t.string :heading
      t.string :body
      t.integer :location_id

      t.timestamps
    end
  end
end
