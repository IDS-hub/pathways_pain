class Api::V1::UserPainCauses::Show < BaseInteraction
	integer :id

	def execute
		find_resource { ::UserPainCause.find_by(id: id) }
	end
end
