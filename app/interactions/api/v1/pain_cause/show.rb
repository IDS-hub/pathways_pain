class Api::V1::PainCause::Show < BaseInteraction
	integer :id

	def execute
		find_resource { ::PainCause.find_by(id: id) }
	end
end
