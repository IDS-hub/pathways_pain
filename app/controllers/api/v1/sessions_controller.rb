# @restful_api 1.0
# User sessions

class Api::V1::SessionsController < Api::V1::ApplicationController

  # @url /api/v1/pain_causes/:pain_cause_id/sessions
  # @action GET
  #
  # Show list of available sessions
  #
  # @required [Integer] pain_cause_id Id of pain cause
  # @optional [String] session_type Type of session. Avalilable: 
  # * _feel_good_ - where session history of given pain cause between 0 and 1
  #
  # @example_request
  #  GET  /api/v1/pain_causes/12/sessions?session_type=feel_good
  #
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #   {
  #     "data": [
  #         {
  #             "id": "1",
  #             "type": "sessions",
  #             "attributes": {
  #                 "name": "test session",
  #                 "session-text": null,
  #                 "position": 1,
  #                 "media-duration-sec": 120,
  #                 "media-link": "path/to/audio/file.mp3",
  #                 "pain-cause-id": 37
  #             }
  #         }
  #     ]
  #   }
  #   ```
  def index
    render_response(
      Api::V1::Session::Index,
      session_params
    )
  end

  # @url /api/v1/pain_causes/:pain_cause_id/sessions/:session_id
  # @action GET
  #
  # Show given session
  #
  # @required [Integer] pain_cause_id Id of pain cause
  # @required [Integer] session_id Id of given session
  #
  # @example_request
  #  GET  /api/v1/pain_causes/12/sessions/3
  #
  #   Headers
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #   {
  #     "data":
  #         {
  #             "id": "1",
  #             "type": "sessions",
  #             "attributes": {
  #                 "name": "test session",
  #                 "session-text": null,
  #                 "position": 1,
  #                 "media-duration-sec": 120,
  #                 "media-link": "path/to/audio/file.mp3",
  #                 "pain-cause-id": 37
  #             }
  #         }
  #   }
  #   ```
  def show
    render_response(
      Api::V1::Session::Show,
      { id: params[:id] },
      { serializer: Api::V1::SessionSerializer }
    )
  end

  private

  def session_params
    params.permit(
      :id,
      :session_type,
      :pain_cause_id
    )
  end
end
