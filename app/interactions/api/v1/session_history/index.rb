class Api::V1::SessionHistory::Index < BaseInteraction
	integer :session_id, default: nil

	def execute
		resource = ::SessionHistory.where(user: current_user) 
		resource = resource.where(session_id: session_id) if session_id
		resource.all
	end
end
