class Api::V1::SessionList::Show < BaseInteraction
	integer :id

	def execute
		resource = ::SessionList.find_by(id: id)
		errors.add(:pain_causes, I18n.t(:not_found)) unless resource
		resource
	end
end