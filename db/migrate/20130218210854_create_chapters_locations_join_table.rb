class CreateChaptersLocationsJoinTable < ActiveRecord::Migration
  def up
	create_table :chapters_locations, :id=>false do |t|
		t.integer :chapter_id
		t.integer :location_id
	end
  end

  def down
  	drop_table :chapters_locations
  end
end
