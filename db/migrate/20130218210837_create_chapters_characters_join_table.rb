class CreateChaptersCharactersJoinTable < ActiveRecord::Migration
  def up
  create_table :chapters_characters, :id=>false do |t|
		t.integer :chapter_id
		t.integer :character_id
	end
  end

  def down
  drop_table :chapters_characters
  end
end
