class CreateCharacterSummaries < ActiveRecord::Migration
  def change
    create_table :character_summaries do |t|
      t.string :heading
      t.string :body
      t.integer :character_id

      t.timestamps
    end
  end
end
