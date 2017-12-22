class Api::V1::UserPainCause::Create < BaseInteraction
	integer :pain_causes_id
	integer :pain_level

	def execute
		resource = ::UserPainCause.new
		resource.update(inputs)
		resource
	end
end