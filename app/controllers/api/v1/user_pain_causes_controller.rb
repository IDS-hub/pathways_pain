class  Api::V1::UserPainCausesController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::UserPainCauses::Index,
			{},
			{ serializer: Api::V1::UserPainCausesSerializer }
		)
	end

	def show
		render_response(
			Api::V1::UserPainCauses::Show,
			{ id: params[:id] },
			{ serializer: Api::V1::UserPainCausesSerializer }
		)
	end

	def update
		# todo
	end

	def create
		# todo
	end

	def destroy
		# todo
	end
end
