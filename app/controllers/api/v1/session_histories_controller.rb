class Api::V1::SessionHistoriesController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::SessionHistory::Index,
			session_history_params,
			{ serializer: Api::V1::SessionHistorySerializer }
		)
	end

	def show
		render_response(
			Api::V1::SessionHistory::Show,
			session_history_params,
			{ serializer: Api::V1::SessionHistorySerializer }
		)
	end

	# creates for current_user by default
	def create
		change_resource(
			Api::V1::SessionHistory::Create,
			Api::V1::SessionHistorySerializer,
			session_history_params
		)
	end

	private

	def session_history_params
		params.permit(:id, :pain_level, :session_id)
	end
end
