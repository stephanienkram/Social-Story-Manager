class CreateCharactersPicturesJoinTable < ActiveRecord::Migration
  def up
	create_table :characters_pictures, :id=>false do |t|
		t.integer :character_id
		t.integer :picture_id
	end
  end

  def down
  	drop_table :characters_pictures
  end
end
