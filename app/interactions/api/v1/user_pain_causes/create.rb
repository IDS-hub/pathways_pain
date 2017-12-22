class Api::V1::UserPainCauses::Create < BaseInteraction
	integer :pain_causes_id
	integer :pain_level

	def execute
		resource = ::UserPainCauses.new
		resource.update(inputs)
		resource
	end
end