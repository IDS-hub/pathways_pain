class Api::V1::UserPainCause::Index < BaseInteraction

	def execute
		resource = ::UserPainCause
		resource = filter_user_pain_causes(resource)
		resource
	end

	private

	def filter_user_pain_causes(resource)
		resource
			.where(user: current_user)
			.includes(:pain_cause)
			.order('pain_causes.name ASC')
	end
end
