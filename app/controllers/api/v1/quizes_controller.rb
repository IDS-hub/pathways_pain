# @restful_api 1.0
# Quizez

class Api::V1::QuizesController < Api::V1::ApplicationController
  # @url api/v1/pain_causes/:pain_cause_id/sessions/:session_id/quizes
  # @action GET
  #
  # Show list of available quizez for given session
  #
  # @required [Integer] pain_cause_id Id of given pain cause
  # @required [Integer] session_id Id of given session
  #
  # @example_request
  #  GET api/v1/pain_causes/1/sessions/2/quizes 
  #
  #   Headers:
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #   {
  #     "data": [
  #         {
  #             "id": "2",
  #             "type": "quiz",
  #             "attributes": {
  #                 "question-text": "Is it possible to cure pain cause without doctors?",
  #                 "answer-text": "Yes, but it is not healthy",
  #                 "answer-bool": true,
  #                 "position": 1
  #             }
  #         },
  #         {
  #             "id": "1",
  #             "type": "quiz",
  #             "attributes": {
  #                 "question-text": "Is it possible to fix pain without doctor help?",
  #                 "answer-text": "t",
  #                 "answer-bool": true,
  #                 "position": 2
  #             }
  #         }
  #     ]
  #   }
  #   ```
  def index
    render_response(
      Api::V1::Quiz::Index,
      quizes_params
    )
  end

  # @url api/v1/pain_causes/:pain_cause_id/sessions/:session_id/quizes/:quiz_id
  # @action GET
  #
  # Show separate quiz
  #
  # @required [Integer] pain_cause_id Id of given pain cause
  # @required [Integer] session_id Id of given session
  # @required [Integer] quiz_id Id of the given quiz
  #
  # @example_request
  #  GET api/v1/pain_causes/1/sessions/2/quizes/3
  #
  #   Headers:
  #   * Content-Type:application/json
  #   * Accept:application/json
  #   * Access-Token:accesstoken
  #
  # @example_response
  #   ```json
  #   {
  #     "data": [
  #         {
  #             "id": "2",
  #             "type": "quiz",
  #             "attributes": {
  #                 "question-text": "Is it possible to cure pain cause without doctors?",
  #                 "answer-text": "Yes, but it is not healthy",
  #                 "answer-bool": true,
  #                 "position": 1
  #             }
  #         }
  #   ```
  def show
    render_response(
      Api::V1::Quiz::Show,
      quizes_params
    )
  end

  private

  def quizes_params
    params.permit(:id, :session_id)
  end
end
