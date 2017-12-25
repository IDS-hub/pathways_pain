class CreateQuizzes < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
    	t.text :question_text, nullable: false
    	t.text :answer_text, nullable: false
    	t.boolean :answer_bool
    	
    	t.integer :position, nullable: false
    	t.boolean :is_deleted, nullable: false, default: false

    	t.references :session, index: true, foreign_key: true

      t.timestamps
    end
  end
end
