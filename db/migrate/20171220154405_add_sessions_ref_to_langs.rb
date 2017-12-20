class AddSessionsRefToLangs < ActiveRecord::Migration[5.1]
  def change
  	change_table(:lang_areas) do |t|
  		t.references :sessions, index: true, foreign_key: true
  	end
  end
end
