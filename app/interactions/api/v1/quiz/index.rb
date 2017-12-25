class Api::V1::Quiz::Index < BaseInteraction
	integer :session_id

	def execute
		resource = ::Quiz
		resource = filter_quizes(resource)
		resource
	end

	private

	def filter_quizes(resource)
		resource
			.where(session_id: session_id)
			.order(position: :asc, created_at: :desc)
	end
end
