class CreateSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :sessions do |t|
    	t.string :name, nullable: false
    	t.text :session_text
    	t.string :media_link, nullable: false
    	t.integer :position, nullable: false
    	t.integer :media_duration_sec

    	t.references :areas, index: true, foreign_key: true
    	t.boolean :is_deleted, default: false
    	
      t.timestamps
    end
  end
end
