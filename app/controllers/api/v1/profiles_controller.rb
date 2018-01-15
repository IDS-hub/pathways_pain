class Api::V1::ProfilesController < Api::V1::ApplicationController
  skip_before_action :authenticate_api_user, only: :create

  def show
    render_response(Api::V1::Profile::Show) do |interaction_result|
      Api::V1::ProfileSerializer.new(interaction_result).as_json 
    end
  end

  def create
    render_response(
      Api::V1::Profile::Create,
      profile_params,
      { serializer: Api::V1::ProfileSerializer }
    )
  end

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
