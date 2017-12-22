class Api::V1::UserPainCause::Update < BaseInteraction
	integer :id
	integer :pain_causes_id
	integer :pain_level

	def execute
		user_pain_cause = find_resource { ::UserPainCause.find_by(id: id) }
		user_pain_cause.update(inputs)
		user_pain_cause
	end
end