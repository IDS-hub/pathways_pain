class Api::V1::SessionHistoriesController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::SessionHistory::Index,
			{},
			{ serializer: Api::V1::SessionHistorySerializer }
		)
	end

	def show
		render_response(
			Api::V1::SessionHistory::Show,
			{ id: params[:id] },
			{ serializer: Api::V1::SessionSerializer }
		)
	end
end
