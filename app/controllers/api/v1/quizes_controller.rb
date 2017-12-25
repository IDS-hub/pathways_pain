class Api::V1::QuizesController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::Quiz::Index,
			quizes_params
		)
	end

	def show
		render_response(
			Api::V1::Quiz::Show,
			quizes_params
		)
	end

	private

	def quizes_params
		params.permit(:id, :session_id)
	end
end
