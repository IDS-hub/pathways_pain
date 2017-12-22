class Api::V1::UserPainCause::Index < BaseInteraction
	object :current_user, User, default: nil

	def execute
		::UserPainCause.where(user: current_user).all
	end
end