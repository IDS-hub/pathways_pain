class Api::V1::ApplicationController < ActionController::Base
  include Api::V1::ErrorSerializer

  before_action :authenticate_api_user

  def jsonapi_parse(params, values)
    ActiveModelSerializers::Deserialization.jsonapi_parse(params, values)
  end

  # todo: serialzier param not work, handle it
  def render_response(klass, interaction_params = {}, render_options = {})
    interaction_response = klass.run(interaction_params.merge(current_user: @current_user))
    response, status     = interaction_response.handler
    result = { json: response, status: status }

    if status == :ok
      block_res     = yield(response) if block_given?
      result[:json] = block_res unless block_res.nil?

      result.merge(render_options)
    else
      result[:json] = Api::V1::ErrorSerializer.serialize(result[:json].as_json, result[:status])
    end

    render result
  end

  def authenticate_api_user
    return nil if request.headers['Access-Token'].blank?
    @current_user ||= User.find_by(access_token: request.headers['Access-Token'])
  end

  # todo: make it more readable, service
  def change_resource(interaction, serializer, eval_params, error_serializer = nil)
    error_serializer ||= Api::V1::ErrorSerializer

    params_with_user = eval_params.merge(current_user: @current_user)
    interaction_res  = interaction.run(params_with_user)

    res_hash = {
      true => lambda do

        if serializer
          render json: serializer.new(interaction_res.result), status: :ok
        else
          render json: nil, status: :no_content
        end

      end,

      false => lambda do
        render json: error_serializer.serialize(interaction_res.errors, :unprocessable_entity)
      end
    }

    res_hash[!!interaction_res.valid?].call
  end

  alias_method :render_interaction_response, :change_resource
end
