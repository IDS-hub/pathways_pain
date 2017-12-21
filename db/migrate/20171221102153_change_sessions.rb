class ChangeSessions < ActiveRecord::Migration[5.1]
  def change
  	remove_column :sessions, :pain_causes_id
  end
end
