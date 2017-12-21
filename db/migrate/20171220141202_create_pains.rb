class CreatePains < ActiveRecord::Migration[5.1]
  def change
    create_table :pains do |t|
    	t.string :name, nullable: false
    	t.references :users, index: true, foreign_key: true
    	t.boolean :is_deleted, default: false
      t.timestamps
    end
  end
end
