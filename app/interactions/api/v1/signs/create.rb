class Api::V1::Signs::Create < ActiveInteraction::Base
  string :email
  string :password

  validate do
    errors.add(:user, I18n.t('interactions.signs.wrong_credentials')) unless logging_user.present? && logging_user.password_valid?(password)
  end

  def execute
    errors.add(:user, I18n.t('interactions.signs.auth_failed')) unless logging_user.update(access_token: SecureRandom.hex(6))
    logging_user
  end

  def logging_user
    @logging_user ||= ::User.find_by(email: email)
  end
end
