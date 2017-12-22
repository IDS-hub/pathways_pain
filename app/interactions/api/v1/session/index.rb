class Api::V1::Session::Index < BaseInteraction
	string :session_type

	def execute
		resource = ::Session.all

		case session_type
		when :feel_good
			resource.feel_good(current_user)
		else
			resource
		end
	end
end
