class Api::V1::SessionListsController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::SessionList::Index,
			{},
			{ serializer: Api::V1::SessionListsSerializer }
		)
	end

	def show
		render_response(
			Api::V1::SessionList::Show,
			{ id: params[:id] },
			{ serializer: Api::V1::SessionListsSerializer }
		)
	end
end
