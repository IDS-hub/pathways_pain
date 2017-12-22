class Api::V1::UserPainCauses::Update < BaseInteraction
	integer :id
	integer :pain_causes_id
	integer :pain_level

	def execute
		byebug
		p inputs
		p inputs.compact

		user_pain_cause = find_resource { ::UserPainCause.find_by(id: id) }
		user_pain_cause.update(inputs)
		user_pain_cause
	end
end