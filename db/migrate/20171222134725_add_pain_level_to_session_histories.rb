class AddPainLevelToSessionHistories < ActiveRecord::Migration[5.1]
  def change
    add_column :session_histories, :pain_level, :integer
  end
end
