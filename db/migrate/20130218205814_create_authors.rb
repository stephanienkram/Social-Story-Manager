class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :username
      t.string :email
      t.string :summary
      t.string :location

      t.timestamps
    end
  end
end
