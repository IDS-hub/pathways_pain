class Api::V1::SessionsController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::Session::Index,
			{ session_type: params[:session_type] },
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
end
