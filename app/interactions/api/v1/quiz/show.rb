class Api::V1::Quiz::Show < BaseInteraction
	integer :id

	def execute
		resource = ::Quiz
		find_resource { resource.find_by(id: id) }
	end
end
