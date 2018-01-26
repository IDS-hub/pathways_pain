# @restful_api 1.0
# User passwords

class Api::V1::PasswordsController < Api::V1::ApplicationController
  skip_before_action :authenticate_api_user, only: [:edit, :update]

  # @url api/v1/password/edit
  # @action GET
  # 
  # Send email with reset password token for given user
  #
  # @required [String] email Email of confirmed user
  # 
  # @example_request
  #   GET api/v1/passwords/edit?email=test@mail.com
  #
  #   Headers:
  #   * Content-Type:application/json
  #   * Accept:application/json
  # @example_response_description Example valid response is null
  # @example_response
  def edit
    res = Api::V1::Password::Edit.run(email: params[:email])
    {
      true => -> { render json: '', status: :ok },
      false => -> { render json: Api::V1::ErrorSerializer.serialize(res.errors, :unprocessable_entity) }
    }[!!res.valid?].call
  end

  # @url api/v1/password
  # @action PATCH
  #
  # Returns new access token by reset password token
  #
  # @required [String] reset_password_token Reset password token. **query param**
  #
  # @example_request
  #   Headers:
  #   * Content-Type:application/json
  #   * Accept:application/json
  #
  # @example_response_description Valid response
  # @example_response
  #   New user token data
  def update
    res = Api::V1::Password::Update.run(reset_password_token: params[:reset_password_token])
    {
      true => -> { render json: Api::V1::AccessTokenSerializer.new(res.result), status: :ok },
      false => -> { render json: Api::V1::ErrorSerializer.serialize(res.errors, :unprocessable_entity) }
    }[!!res.valid?].call
  end
end
