# @restful_api 1.0
# Validation user token
class Api::V1::ValidatesController < Api::V1::ApplicationController
  skip_before_action :authenticate_api_user

  # @url api/v1/profile/validates/:confirmation_token
  # @action GET
  #
  # Validate user confirmation token. Send via email if at sign up action if _is_skip_verify_ param if _false_
  #
  # @required [String] confirmation_token Registration confirmation token
  #
  # @example_request
  #  GET /api/v1/profile/validates/very-long-and-harreadable-token-here23123123123123
  #
  # @example_response_description In case if confirmation was completed successfully
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
    render_response(
      Api::V1::Validate::Show,
      { confirmation_token: params[:confirmation_token]}
    )
  end
end