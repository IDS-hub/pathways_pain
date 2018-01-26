# @restful_api 1.0
# User session history

class Api::V1::SessionHistoriesController < Api::V1::ApplicationController
  # @url api/v1/profile/session_histories
  # @action GET
  #
  # Show current user session history
  #
  # @optional [Integer] session_id Id of selected session
  # @optional [Integer] pain_cause_id Id of pain cause
  # @optional [String] sort_order Sort order. Allowed: 'asc', 'desc'. Default is _desc_
  # @optional [Any] is_chart Show short list with minimun fields if param is present
  #
  # @example_request_description Request with all optional params filled for chart
  # @example_request
  #   GET /api/v1/profile/session_histories?session_id=1&pain_cause_id=37&is_chart=true
  #
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response_description Short list for chart
  # @example_response
  #   ```json
  #     [
  #       {
  #           "id": 5,
  #           "pain_level": 3,
  #           "created_at": "2018-01-26T11:04:16.423Z"
  #       },
  #       {
  #           "id": 4,
  #           "pain_level": 3,
  #           "created_at": "2018-01-26T11:04:09.466Z"
  #       }
  #     ]
  #   ```
  def index
    render_response_args = [
      Api::V1::SessionHistory::Index,
      session_history_params
    ]

    render_response(*render_response_args) do |interaction_results|
      if params[:is_chart]
        ActiveModel::Serializer::CollectionSerializer.new(
          interaction_results,
          serializer: Api::V1::SessionHistoryChartSerializer 
        ).as_json
      end
    end

  end

  # @url api/v1/profile/session_histories/:session_history_id
  # @action GET
  #
  # Show given history of current user
  #
  # @required [Integer] session_history_id Id of given history
  # 
  # @example_request
  #   GET api/v1/profile/session_histories/1
  #
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #    {
  #      "data": {
  #          "id": "5",
  #          "type": "session-history",
  #          "attributes": {
  #              "session-id": 1,
  #              "pain-level": 3,
  #              "created-at": "2018-01-26T11:04:16.423Z",
  #              "pain-cause-id": 37,
  #              "media-duration-sec": 120
  #          }
  #       }
  #     }
  #   ```
  def show
    render_response(
      Api::V1::SessionHistory::Show,
      session_history_params,
      { serializer: Api::V1::SessionHistorySerializer }
    )
  end

  # creates for current_user by default
  # @url api/v1/profile/session_histories
  # @action POST
  #
  # Create new entity in user session histories for current user
  #
  # @required [Integer] pain_level Pain level in 1..10
  # @required [Integer] session_id Id of session
  #
  # @example_request
  #   Headers:
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #   
  #   ```json
  #    {
  #      "pain_level": 3,
  #      "session_id": 1
  #    }
  #   ```
  #
  # @example_response
  #   ```json
  #    {
  #        "data": {
  #            "id": "6",
  #            "type": "session-history",
  #            "attributes": {
  #                "session-id": 1,
  #                "pain-level": 3,
  #                "created-at": "2018-01-26T12:07:09.677Z",
  #                "pain-cause-id": 37,
  #                "media-duration-sec": 120
  #            }
  #        }
  #    }
  #   ```
  def create
    change_resource(
      Api::V1::SessionHistory::Create,
      Api::V1::SessionHistorySerializer,
      session_history_params
    )
  end

  private

  # jsonapi parse
  def session_history_params
    params.permit(
      :id,
      :pain_level,
      :session_id,
      :is_chart,
      :pain_cause_id,
      :sort_order
    )
  end
end
