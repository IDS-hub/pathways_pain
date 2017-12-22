class Api::V1::UserPainCauses::Index < BaseInteraction
	object :current_user, User, default: nil

	def execute
		::UserPainCauses.where(user: current_user).all
	end
end