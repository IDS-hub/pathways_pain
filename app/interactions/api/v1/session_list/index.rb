class Api::V1::SessionList::Index < BaseInteraction
	def execute
		::SessionList.all
	end
end
