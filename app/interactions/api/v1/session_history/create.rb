class Api::V1::SessionHistory::Create < BaseInteraction
	object :current_user, class: User
	integer :pain_level
	integer :session_id

	def execute
		history = ::SessionHistory.new

		history.user 		   = current_user
		history.pain_level = pain_level
		history.session_id = session_id

		# todo: add to each field
		if history.save
			history
		else
			errors.add(:base, history.errors.full_messages.to_sentence)
		end
	end
end
