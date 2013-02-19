class CreateChaptersPicturesJoinTable < ActiveRecord::Migration
  def up
	create_table :chapters_pictures, :id=>false do |t|
		t.integer :chapter_id
		t.integer :picture_id
	end
  end

  def down
  	drop_table :chapters_pictures
  end
end
