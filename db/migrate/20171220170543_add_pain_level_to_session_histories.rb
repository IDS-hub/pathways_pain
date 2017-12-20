class AddPainLevelToSessionHistories < ActiveRecord::Migration[5.1]
  def change
    change_table(:session_histories) do |t|
    	t.integer :pain_level
    end
  end
end
