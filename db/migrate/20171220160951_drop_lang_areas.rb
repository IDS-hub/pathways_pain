class DropLangAreas < ActiveRecord::Migration[5.1]
  def change
  	drop_table :lang_areas
  end
end
