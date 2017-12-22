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
			{ serializer: Api::V1::SessionHistorySerializer }
		)
	end

	# creates for current_user by default
	def create
		render_response(
			Api::V1::SessionHistory::Create,
			session_history_params,
			{ serializer: Api::V1::SessionHistorySerializer }
		)
	end

	private

	def session_history_params
		jsonapi_parse(
			params,
			only: %(id pain_level user_id)
		)
	end
end
