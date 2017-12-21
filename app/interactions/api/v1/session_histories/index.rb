class Api::V1::SessionHistory::Index < BaseInteraction
	def execute
		::SessionHistory.all
	end
end
