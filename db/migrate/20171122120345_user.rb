class User < ActiveRecord::Migration[5.1]
  def change
    create_table :profile do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.string :access_token
      t.string :reset_password_token

      t.timestamps
    end

    add_index :profile, :email, unique: true
    add_index :profile, :reset_password_token, unique: true
  end
end
