class Api::V1::PasswordsController < Api::V1::ApplicationController
  skip_before_action :authenticate_api_user, only: [:edit, :update]

  def edit
    res = Api::V1::Password::Edit.run(email: params[:email])
    {
      true => -> { render json: '', status: :ok },
      false => -> { render json: Api::V1::ErrorSerializer.serialize(res.errors, :unprocessable_entity) }
    }[!!res.valid?].call
  end

  def update
    res = Api::V1::Password::Update.run(reset_password_token: params[:reset_password_token])
    {
      true => -> { render json: Api::V1::AccessTokenSerializer.new(res.result), status: :ok },
      false => -> { render json: Api::V1::ErrorSerializer.serialize(res.errors, :unprocessable_entity) }
    }[!!res.valid?].call
  end
end
