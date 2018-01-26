class Api::V1::Signs::Create < ActiveInteraction::Base
  string :email
  string :password

  validate do
    if !logging_user.present? && !logging_user&.password_valid?(password)
      errors.add(:user, I18n.t('interactions.signs.wrong_credentials'))
    end
  end

  def execute
    if !logging_user.update(access_token: SecureRandom.hex(6))
      errors.add(:user, I18n.t('interactions.signs.auth_failed'))
    end
 
    logging_user
  end

  def logging_user
    @logging_user ||= ::User.find_by(email: email)
  end
end
