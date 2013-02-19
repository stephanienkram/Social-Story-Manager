class CreateAuthorStatuses < ActiveRecord::Migration
  def change
    create_table :author_statuses do |t|
      t.string :status
      t.string :author_idinteger

      t.timestamps
    end
  end
end
