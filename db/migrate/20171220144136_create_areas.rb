class CreateAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :areas do |t|
    	t.string :name, nullable: false
    	t.boolean :is_deleted, default: false
      t.timestamps
    end
  end
end
