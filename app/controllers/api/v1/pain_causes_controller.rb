# @restful_api 1.0
# Pain causes

class Api::V1::PainCausesController < Api::V1::ApplicationController
  # @url api/v1/pain_causes
  # @action GET
  #
  # Show list of all available pain causes
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
  #   "data": [
  #       {
  #           "id": "1",
  #           "type": "pain-causes",
  #           "attributes": {
  #               "name": "Arteriosclerosis"
  #           }
  #       },
  #       {
  #           "id": "2",
  #           "type": "pain-causes",
  #           "attributes": {
  #               "name": "Arthritis"
  #           }
  #       }
  #     ]
  #   }
  #   ```
  def index
    render_response(
      Api::V1::PainCause::Index,
      {},
      { serializer: Api::V1::PainCauseSerializer }
    )
  end

  # @url api/v1/pain_causes/:id
  # @action GET
  #
  # Show separate pain cause description
  #
  # @required [Integer] id Id of given pain cause
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
  #     "data": {
  #       "id": "1",
  #       "type": "pain-causes",
  #       "attributes": {
  #         "name": "Arteriosclerosis"
  #        }
  #     }
  #   }
  def show
    render_response(
      Api::V1::PainCause::Show,
      { id: params[:id] },
      { serializer: Api::V1::PainCauseSerializer }
    )
  end
end
