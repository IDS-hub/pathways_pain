class Api::V1::UserPainCause::Update < BaseInteraction
	integer :id
	integer :pain_cause_id
	integer :pain_level

	def execute
		resource = find_resource { ::UserPainCause.find_by(id: id) }

		resource.pain_cause_id = pain_cause_id if pain_cause_id
		resource.pain_level    = pain_level if pain_level

		if resource.save
			resource
		else
			errors.add(
				:user_pain_cause,
				resource.errors.full_messages.to_sentence
			)
		end
	end
end
