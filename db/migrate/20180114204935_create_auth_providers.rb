class CreateAuthProviders < ActiveRecord::Migration[5.1]
  def change
    create_table :auth_providers do |t|
    	t.string :name, unique: true
    end

    create_table :users_auth_providers do |t|
    	t.string :provider_access_token
    	t.references :auth_provider, foreign_key: true
    	t.references :user, foreign_key: true
    end

	  add_index :users_auth_providers, [:user_id, :auth_provider_id]
  end
end
