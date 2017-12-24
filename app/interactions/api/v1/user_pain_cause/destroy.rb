class Api::V1::UserPainCause::Destroy < BaseInteraction
	integer :id

	def execute
		user_pain_cause = find_resource { ::UserPainCause.find_by(id: id) }

		if user_pain_cause
			user_pain_cause.is_deleted = true
			user_pain_cause.save(validate: false)
		end

		nil
	end
end