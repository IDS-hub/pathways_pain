class Api::V1::ValidatesController < Api::V1::ApplicationController
	skip_before_action :authenticate_api_user

	def show
		render_response(
			Api::V1::Validate::Show,
			{ confirmation_token: params[:confirmation_token]}
		)
	end
end