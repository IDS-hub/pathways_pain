class Api::V1::PainCause::Index < BaseInteraction
	def execute
		::PainCause.all
	end
end
