class Api::V1::AuthProvider::Show < BaseInteraction
	def execute
		current_user.users_auth_providers
	end
end
