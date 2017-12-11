class Api::V1::Password::Update < BaseInteraction
  object :current_user, class: User, default: nil
  string :reset_password_token

  validate do
    errors.add(:base, 'Can not reset password. Please try again') if user.blank?
  end

  def execute
    user.update(reset_password_token: nil, access_token: SecureRandom.hex(6))
    user
  end

  def user
    @user ||= User.find_by(reset_password_token: reset_password_token)
  end
end