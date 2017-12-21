class Api::V1::PainCausesController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::PainCause::Index,
			{},
			{ serializer: Api::V1::PainCauseSerializer }
		)
	end

	def show
		render_response(
			Api::V1::PainCause::Show,
			{ id: params[:id] },
			{ serializer: Api::V1::PainCauseSerializer }
		)
	end
end
