class CreateSessionHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :session_histories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :session, index: true, foreign_key: true
      t.boolean :is_completed, default: false

      t.timestamps
    end
  end
end
