class Api::V1::UserPainCause::Create < BaseInteraction
	integer :pain_cause_id
	integer :pain_level

	def execute
		resource = ::UserPainCause
		resource = resource.new

		resource.pain_cause_id = pain_cause_id
		resource.pain_level    = pain_level
		resource.user_id       = current_user.id

		if resource.save
			resource
		else
			errors.add(:user_pain_cause, resource.errors.full_messages.to_sentence)
		end
	end
end
