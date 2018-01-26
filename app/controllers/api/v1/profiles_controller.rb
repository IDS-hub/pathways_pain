# @restful_api 1.0
# User profiles

class Api::V1::ProfilesController < Api::V1::ApplicationController
  skip_before_action :authenticate_api_user, only: :create

  # @url api/v1/profile
  # @action GET
  #
  # Show current user profile info
  #
  # @example_request
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/jsonі
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #   {
  #      "id": 1,
  #      "first_name": "First",
  #      "last_name": "Last",
  #      "email": "profile@test.com",
  #      "access_token": "accesstoken",
  #      "reset_password_token": null
  #    }
  def show
    render_response(Api::V1::Profile::Show) do |interaction_result|
      Api::V1::ProfileSerializer.new(interaction_result).as_json 
    end
  end

  # @url api/v1/profile
  # @action POST
  # 
  # Sign up new user
  #
  # @optional [String] first_name User first name
  # @optional [String] last_name User last name
  # @optional [Boolean] is_skip_verify (default: _true_). Skip sending verification email to 
  #   entered _email_ if _true_ 
  # @required [String] email User email
  # @required [String] password User password
  # @required [String] password_confirmation Same value as _password_ field
  #
  # @example_request
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #
  #   ```json
  #   {
  #     "data": {
  #       "type": "users",
  #       "attributes": { 
  #         "email": "vvvvvv_test@test.com",
  #         "first_name": "first",
  #         "last_name": "last",
  #         "password": "password",
  #         "password_confirmation": "password",
  #         "is_skip_verify": false
  #       }
  #     }
  #   }
  #   ```
  # @example_response_description Null if not skipping verification. Otherwise will be new user data
  # @example_response
  #   
  def create
    render_response(
      Api::V1::Profile::Create,
      profile_params,
      { serializer: Api::V1::ProfileSerializer }
    )
  end

  # @url api/v1/profile
  # @action PATCH
  # 
  # Update user data for current user
  #
  # @optional [String] email New user email
  # @optional [String] first_name New user first name
  # @optional [String] last_name New user last name
  # @optional [String] password New user password
  # @optional [String] password_confirmation Same value as _password_
  #   field. Pairwise with _password_
  #
  # @example_request
  #   Headers:
  #    * Content-Type:application/json
  #    * Accept:application/json
  #    * Access-Token:accesstoken
  #
  #   ```json
  #      {
  #     "data": {
  #       "type": "profiles",
  #       "attributes": {
  #         "email": "user@test.com",
  #         "first_name": "FirstName",
  #         "last_name": "LastName",
  #         "password": "passwod",
  #         "password_confirmation": "password"
  #       }
  #     }
  #    }
  #   ```
  #
  # @example_response_description Success response
  # @example_response 
  #   ```json
  #   {
  #     "encrypted_password": "$2a$10$fZaBsJ.296ZwvnMlCevmaucVQYjdnb4btuECBg1KDAvYVO1iIimWu",
  #     "salt": "$2a$10$fZaBsJ.296ZwvnMlCevmau",
  #     "first_name": "FirstName",
  #     "last_name": "LastName",
  #     "email": "very_new_email@test.com",
  #     "id": 1,
  #     "access_token": "accesstoken",
  #     "reset_password_token": null,
  #     "created_at": "2017-12-26T10:03:08.300Z",
  #     "updated_at": "2018-01-26T10:04:22.470Z",
  #     "confirmed_at": "2018-01-25T17:16:53.060Z"
  #   }
  #   ```
  def update
    render_response(
      Api::V1::Profile::Update,
      profile_params,
      { serializer: Api::V1::ProfileSerializer }
    )
  end

  private

  def profile_params
    jsonapi_parse(
      params,
      only: %w[first_name last_name email password password_confirmation is_skip_verify]
    )
  end
end
