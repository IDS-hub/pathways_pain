class CreatePainCauses < ActiveRecord::Migration[5.1]
  def change
    create_table :pain_causes do |t|
    	t.string :name, nullable: false
    	t.boolean :is_deleted, default: false
      t.timestamps
    end
  end
end
