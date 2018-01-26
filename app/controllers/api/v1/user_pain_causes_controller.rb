# @restful_api 1.0
# Managing pain causes of given user

class  Api::V1::UserPainCausesController < Api::V1::ApplicationController

  # @url /api/v1/profile/user_pain_causes
  # @action GET
  #
  # Get user pain causes list
  #
  # @example_request
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #   {
  #       "data": [
  #           {
  #               "id": "2",
  #               "type": "user-pain-cause",
  #               "attributes": {
  #                   "name": "Arthritis",
  #                   "user-id": 1,
  #                   "pain-cause-id": 2,
  #                   "pain_level": 5
  #               }
  #           },
  #           {
  #               "id": "1",
  #               "type": "user-pain-cause",
  #               "attributes": {
  #                   "name": "Back Pain",
  #                   "user-id": 1,
  #                   "pain-cause-id": 3,
  #                   "pain_level": 5
  #               }
  #           }
  #       ]
  #   }
  #   ```
  def index
    render_response(
      Api::V1::UserPainCause::Index,
      user_pain_cause_params
    )
  end

  # @url /api/v1/profile/user_pain_causes/:user_pain_cause_id
  # @action GET
  #
  # Show given user pain cause
  #
  # @required [Integer] user_pain_cause_id Id of user pain cause
  #
  # @example_request
  #   GET /api/v1/profile/user_pain_causes/3
  #
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #    {
  #         "data": {
  #             "id": "2",
  #             "type": "user-pain-cause",
  #             "attributes": {
  #                 "name": "Arthritis",
  #                 "user-id": 1,
  #                 "pain-cause-id": 2,
  #                 "pain_level": 5
  #             }
  #         }
  #     }
  #   ```
  def show
    render_response(
      Api::V1::UserPainCause::Show,
      user_pain_cause_params
    )
  end


  # @url /api/v1/profile/user_pain_causes/:user_pain_cause_id
  # @action PUT
  #
  # Update user pain cause
  #
  # @required [Integer] user_pain_cause User pain cause id
  # @required [Integer] pain_cause_id Id of pain cause
  # @required [Integer] pain_level Pain level of current pain cause
  #
  # @example_request
  #  PUT /api/v1/profile/user_pain_causes/1
  #
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  #   ```json
  #    {
  #      "pain_cause_id": 14,
  #      "pain_level": 5
  #    }
  #   ```
  # @example_response
  #   ```json
  #    {
  #        "data": {
  #            "id": "1",
  #            "type": "user-pain-cause",
  #            "attributes": {
  #                "name": "Gout",
  #                "user-id": 1,
  #                "pain-cause-id": 15,
  #                "pain_level": 5
  #            }
  #        }
  #    }
  #   ```
  def update
    change_resource(
      Api::V1::UserPainCause::Update,
      Api::V1::UserPainCauseSerializer,
      user_pain_cause_params
    )
  end

  # @url /api/v1/profile/user_pain_causes
  # @action POST
  #
  # Update user pain cause
  #
  # @required [Integer] pain_cause_id Id of pain cause
  # @required [Integer] pain_level Pain level of current pain cause
  #
  # @example_request
  #  POST /api/v1/profile/user_pain_causes
  #
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  #   ```json
  #    {
  #      "pain_cause_id": 14,
  #      "pain_level": 5
  #    }
  #   ```
  def create
    change_resource(
      Api::V1::UserPainCause::Create,
      Api::V1::UserPainCauseSerializer,
      user_pain_cause_params
    )
  end

  # @url /api/v1/profile/user_pain_causes/:user_pain_cause_id
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
  # @example_response_description Null result here if success
  # @example_response
  #     
  def destroy
    change_resource(
      Api::V1::UserPainCause::Destroy,
      nil,
      user_pain_cause_params
    )
  end

  private

  def user_pain_cause_params
    params.permit(:id, :pain_cause_id, :pain_level)
  end
end
