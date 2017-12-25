class Api::V1::SessionHistory::Index < BaseInteraction
	integer :session_id, default: nil
	integer :pain_cause_id, default: nil
	string :sort_order, default: "desc"

	def execute
		resource = ::SessionHistory.where(user: current_user)
		resource = filter_resource(resource)
		resource.order(created_at: sort_order)
	end

	private

	def filter_resource(resource)
		resource = resource.where(session_id: session_id) if session_id
		resource = resource
			.includes(:session)
			.where(sessions: { pain_cause_id: pain_cause_id }) if pain_cause_id

		resource
	end
end
