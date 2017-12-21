class CreateSessionLists < ActiveRecord::Migration[5.1]
  def change
    create_table :session_lists do |t|
    	t.string :name
    	t.references :pain_causes, index: true, foreign_key: true
      t.timestamps
    end
  end
end
