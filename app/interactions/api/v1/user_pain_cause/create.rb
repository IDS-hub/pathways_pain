class Api::V1::UserPainCause::Create < BaseInteraction
	object :current_user, class: User
	integer :pain_causes_id
	integer :pain_level

	# todo: current user handle
	def execute
		resource = ::UserPainCause.new
		resource.update(inputs)
		resource
	end
end
