# @restful_api 1.0
# Third party authorization providers

class Api::V1::AuthProvidersController < Api::V1::ApplicationController
	skip_before_action :authenticate_api_user, only: :create

  # @url api/v1/auth_providers
  # @action POST
  #
  # Sign in given user by thrid-party provider (e.g. facebook, google etc.)
  #
  # @required [String] login user login. Usually is email
  # @required [Hash] provider_info provider information data
  # @optional [String] first_name first name of user
  # @optional [String] last_name last name of the given user
  #
  # @example_request_description Example for invalid response
  # @example_request
  #   ```json
  #   {
  #    "first_name": "Test",
  #    "last_name": "Fb user",
  #    "login": "test_login@gmail.com",
  #    "provider_info": {
  #      "provider_name": "facebook",
  #      "provider_token": "EAAKdIoryhDxglwSqLCbmc7uxuqEjlM0qYUXPnxPUOlkZCKRUfjZCX4aIZD"
  #    }
  #   }
  #   ```
	def create
		res = Api::V1::AuthProvider::Create.run(registrations_params)
		{
			true => lambda { render json: Api::V1::AccessTokenSerializer.new(res.result), status: :ok },
			false => lambda { render json: Api::V1::ErrorSerializer.serialize(res.errors, :unprocessable_entity) }
		}[!!res.valid?].call
	end

	# @url api/v1/auth_providers
	# @action GET
	#
	# Show actual providers list for logged in user
	#
	# @example_request_description List of logged in user thrid-party providers
	# @example_request
	#   Headers
	#   * Content-Type:application/json
	#	  * Accept:application/json
	#   * Access-Token:accesstoken
	#
	# @example_response_description Array of user providers info
	# @example_response
	#   ```json
	#   [
	#     {
	#         "id": 1,
	#         "provider_name": "facebook",
	#         "provider_access_token": "provideraccesstoken"
	#     }
	#   ]
	#   ```
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
