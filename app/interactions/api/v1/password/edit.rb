class Api::V1::Password::Edit < BaseInteraction
  object :current_user, class: User, default: nil
  string :email

  validate do
    errors.add(:base, I18n.t('interactions.password.no_user')) if user.blank?
  end

  def execute
    user.update(reset_password_token: SecureRandom.hex(6))
    ServiceMailer.reset_password_email(user).deliver_later
  end

  def user
    @user ||= User.find_by(email: email)
  end
end