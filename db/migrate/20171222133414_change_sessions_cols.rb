class ChangeSessionsCols < ActiveRecord::Migration[5.1]
  def change
  	add_reference :sessions, :pain_causes, index: true, foreign_key: true
  end
end
