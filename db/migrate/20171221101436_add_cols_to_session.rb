class AddColsToSession < ActiveRecord::Migration[5.1]
  def change
  	change_table(:sessions) do |t|
  		t.references :session_lists, index: true, foreign_key: true
  	end
  end
end
