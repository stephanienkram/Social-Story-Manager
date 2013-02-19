class RenameAuthorStatuses < ActiveRecord::Migration
  def up
  	remove_column :author_statuses, :author_idinteger
  	change_table :author_statuses do |t|
  		t.integer :author_id
  	end
  end

  def down
  end
end
