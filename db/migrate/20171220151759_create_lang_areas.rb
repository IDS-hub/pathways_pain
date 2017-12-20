class CreateLangAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :lang_areas do |t|
    	t.string :name, nullable: false
    	t.string :enum, nullable: false
    	t.references :area, index: true, foreign_key: true
      t.timestamps
    end
  end
end
