class Api::V1::AuthProvidersController < Api::V1::ApplicationController
	skip_before_action :authenticate_api_user, only: :create

	def create
		res = Api::V1::AuthProvider::Create.run(registrations_params)
		{
			true => lambda { render json: Api::V1::AccessTokenSerializer.new(res.result), status: :ok },
			false => lambda { render json: Api::V1::ErrorSerializer.serialize(res.errors, :unprocessable_entity) }
		}[!!res.valid?].call
	end

	def show
		render_response(Api::V1::AuthProvider::Show) do |interaction_resp|
			ActiveModel::Serializer::CollectionSerializer.new(
				interaction_resp,
				serializer: Api::V1::UserAuthProviderSerializer
			).as_json
		end
	end

	private

	def registrations_params
		params.permit(
			:first_name,
			:last_name,
			:login,
			provider_info: [
				:provider_name,
				:provider_token
			]
		)
	end
end
