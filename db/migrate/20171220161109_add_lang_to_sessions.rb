class AddLangToSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :sessions, :lang, :int, default: 0
  end
end
