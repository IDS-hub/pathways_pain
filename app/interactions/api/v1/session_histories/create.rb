class Api::V1::SessionHistory::Create < BaseInteraction
	object :current_user, class: User, default: nil
	integer :pain_level

	def execute
		history = SessionHistory.new
		history.user = current_user
		history.pain_level = pain_level
		history.save

		# need I zus?
		history
	end
end
