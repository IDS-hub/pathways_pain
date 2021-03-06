class CreateUserPainCauses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_pain_causes do |t|
    	t.references :pain_cause, index: true, foreign_key: true
    	t.references :user, index: true, foreign_key: true
    	t.integer :pain_level, default: nil

    	t.boolean :is_deleted, default: false
      t.timestamps
    end
  end
end
