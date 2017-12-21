class Api::V1::Session::Index < BaseInteraction
	def execute
		::Session.all
	end
end
