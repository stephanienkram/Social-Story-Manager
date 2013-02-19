class CreateCharactersLocationJoinTable < ActiveRecord::Migration
  def up
	create_table :characters_locations, :id=>false do |t|
		t.integer :character_id
		t.integer :location_id
	end
  end

  def down
  	drop_table :characters_locations
  end
end
