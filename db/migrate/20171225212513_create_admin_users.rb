class CreateAdminUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :login
    	t.string :salt
    	t.string :password

      t.timestamps
    end
  end
end
