class Api::V1::SessionHistoriesController < Api::V1::ApplicationController
	def index
		render_response_args = [
			Api::V1::SessionHistory::Index,
			session_history_params
		]

		render_response(*render_response_args) do |interaction_results|
			if params[:is_chart]
				ActiveModel::Serializer::CollectionSerializer.new(
			 		interaction_results,
			 		serializer: Api::V1::SessionHistoryChartSerializer 
			 	).as_json
			end
		end

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

	# jsonapi parse
	def session_history_params
		params.permit(
			:id,
			:pain_level,
			:session_id,
			:is_chart,
			:pain_cause_id,
			:sort_order
		)
	end
end
