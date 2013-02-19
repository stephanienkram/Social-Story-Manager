class CreateLocationsPicturesJoinTable < ActiveRecord::Migration
  def up
	create_table :locations_pictures, :id=>false do |t|
		t.integer :location_id
		t.integer :picture_id
	end
  end

  def down
  	drop_table :locations_picture
  end
end
