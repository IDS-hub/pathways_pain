class CreatePainAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :pain_areas do |t|
    	t.references :areas, index: true, foreign_key: true
    	t.references :pains, index: true, foreign_key: true
    	t.references :users, index: true, foreign_key: true

    	t.boolean :is_deleted, default: false
      t.timestamps
    end
  end
end
