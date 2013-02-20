class CreateAuthorAuthors < ActiveRecord::Migration
  def change
    create_table :author_authors do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    
    add_index :author_authors, :follower_id
    add_index :author_authors, :followed_id
    add_index :author_authors, [:follower_id, :followed_id], unique: true
  end
end
