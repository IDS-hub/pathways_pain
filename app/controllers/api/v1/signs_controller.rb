# @restful_api 1.0
# Managing access token

class Api::V1::SignsController < Api::V1::ApplicationController
  skip_before_action :authenticate_api_user, only: :create

  # @url api/v1/sign
  # @action POST
  #
  # Get access token depend on user credentials
  #
  # @required [String] email Email of given user
  # @required [String] password Password of given user
  #
  # @example_request 
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #
  #   ```json
  #    {
  #     "data": {
  #       "type": "users",
  #       "attributes": { 
  #         "email": "user@test.com",
  #         "password": "password"
  #       }
  #     }
  #    }
  #   ```
  #
  # @example_response
  #   ```json
  #    {
  #      "data": {
  #          "id": "4",
  #          "type": "access-token",
  #          "attributes": {
  #              "access-token": "e9ccc461a53f"
  #          }
  #      }
  #   }
  #   ```
  def create
    res = Api::V1::Signs::Create.run(user_params)
    {
      true => -> { render json: Api::V1::AccessTokenSerializer.new(res.result), status: :ok },
      false => -> { render json: Api::V1::ErrorSerializer.serialize(res.errors, :unprocessable_entity) }
    }[!!res.valid?].call
  end

  # @url api/v1/signs
  # @action DELETE
  #
  # Invalidate current user access token
  #
  # @example_request
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #    {
  #      "message": "successfully logged out"
  #    }
  #   ```
  def destroy
    render_response(Api::V1::Signs::Destroy)
  end

  private

  def user_params
    jsonapi_parse(params, only: %w(email password))
  end
end
