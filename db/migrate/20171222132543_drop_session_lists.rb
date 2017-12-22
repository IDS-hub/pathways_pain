class DropSessionLists < ActiveRecord::Migration[5.1]
  def change
  	remove_column :sessions, :session_lists_id, :integer
  	drop_table :session_lists # no rollback here!
  end
end
