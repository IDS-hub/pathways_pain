class ChangeSessions < ActiveRecord::Migration[5.1]
  def change
  	remove_column :sessions, :pain_cause_id, :integer
  end
end
