class AddPainLevelToPainAreas < ActiveRecord::Migration[5.1]
  def change
    add_column :pain_areas, :pain_level, :integer
  end
end
