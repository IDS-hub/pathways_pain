class Api::V1::SessionsController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::Session::Index,
			session_params,
			{ serializer: Api::V1::SessionsSerializer }
		)
	end

	def show
		render_response(
			Api::V1::Session::Show,
			{ id: params[:id] },
			{ serializer: Api::V1::SessionsSerializer }
		)
	end

	private

	def session_params
		params.permit(
			:id,
			:session_type,
			:pain_cause_id
		)
	end
end
