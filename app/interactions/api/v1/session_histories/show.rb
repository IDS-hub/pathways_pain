class Api::V1::SessionHistory::Show < BaseInteraction
	integer :id

	def execute
		find_resource { ::SessionHistory.find_by(id: id) }
	end
end
