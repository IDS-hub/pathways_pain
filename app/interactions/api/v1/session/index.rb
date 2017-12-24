class Api::V1::Session::Index < BaseInteraction
	string :session_type, default: nil
	integer :pain_cause_id

	def execute
		resource = ::Session.where(pain_cause_id: pain_cause_id)

		case session_type
		when "feel_good"
			resource = resource.feel_good(current_user.id)
		end

		resource.order(name: :asc)
	end
end
