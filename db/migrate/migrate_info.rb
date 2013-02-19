class CreateAuthors < ActiveRecord::Migration
  def change
  
    create_table :authors do |t|
      t.string :username
      t.string :email
      t.string :summary
      t.string :location

      t.timestamps
    end
    
    create_table :authorstatus do |t|
    	t.integer :author_id
    	t.string :status
    	t.timestamps
	end
	
	create_table :projects do |t|
		t.string :name
		t.string :elevator
		t.string :skeleton
		t.string :notes
		t.timestamps
	end
	
	create_table :projectstatus do |t|
		t.integer :project_id
		t.string :status
		t.timestamps
	end
	
	create_table :projectupdates do |t|
		t.integer :project_id
		t.string :update
		t.timestamps
	end
	
	create_table :outlines do |t|
		t.integer :project_id
		t.string :title
		t.integer :order
		t.string :description
		t.string :notes
		t.timestamps
	end
	
	create_table :chapters do |t|
		t.integer :project_id
		t.string :title
		t.string :body
		t.string :notes
		t.timestamps
	end
	
	create_table :characters do |t|
		t.integer :project_id
		t.string :name
		t.string :elevator
		t.timestamps
	end
	
	create_table :character_sum do |t|
		t.integer :character_id
		t.string :heading
		t.string :body
		t.timestamps
	end
	
	create_table :locations do |t|
		t.integer :project_id
		t.string :name
		t.string :elevator
		t.timestamps
	end
	
	create_table :locations_sum do |t|
		t.integer :location_id
		t.string :heading
		t.string :body
		t.timestamps
	end
	
	create_table :pictures do |t|
		t.integer :project_id
		t.string :name
		t.string :location
		t.timestamps
	end
	
	
	create_table :projects_authors, :id => false do |t|
		t.integer :project_id
		t.integer :author_id
	end
	
	create_table :chapters_characters, :id=>false do |t|
		t.integer :chapter_id
		t.integer :character_id
	end
	
	create_table :chapters_locations, :id=>false do |t|
		t.integer :chapter_id
		t.integer :location_id
	end
	
	create_table :chapters_pictures, :id=>false do |t|
		t.integer :chapter_id
		t.integer :picture_id
	end
	
	create_table :characters_locations, :id=>false do |t|
		t.integer :character_id
		t.integer :location_id
	end
	
	create_table :characters_pictures, :id=>false do |t|
		t.integer :character_id
		t.integer :picture_id
	end
	
	create_table :locations_pictures, :id=>false do |t|
		t.integer :location_id
		t.integer :picture_id
	end
	
  end
end
