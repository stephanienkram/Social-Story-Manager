class CreateProjectsAuthorsJoinTable < ActiveRecord::Migration
  def up
  create_table :projects_authors, :id => false do |t|
		t.integer :project_id
		t.integer :author_id
	end
  end

  def down
  	drop_table :projects_authors
  end
end
