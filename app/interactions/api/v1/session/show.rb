class Api::V1::Session::Show < BaseInteraction
	integer :id

	def execute
		find_resource { ::Session.find_by(id: id) }
	end
end
