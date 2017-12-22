class Api::V1::SessionHistory::Index < BaseInteraction
	def execute
		::SessionHistory.where(user: current_user).all
	end
end
