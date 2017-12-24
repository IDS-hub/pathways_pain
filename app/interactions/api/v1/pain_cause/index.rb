class Api::V1::PainCause::Index < BaseInteraction
	def execute
		resource = ::PainCause
		resource.order(name: :asc)
	end
end
