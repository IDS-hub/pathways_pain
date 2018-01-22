class ServiceMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def reset_password_email(user)
    @url = api_v1_password_url(reset_password_token: user.try(:reset_password_token))
    mail(
      to: user.try(:email),
      subject: I18n.t('mailers.service_mailer.reset_password_email.subject')
    )
  end

  def verify_password_email(user, verify_token)
  	# client_point = Rails.application.secrets.client_verification_point
    client_point = DATA['client_verification_point'] # only for staging purposes
  	@url = client_point + verify_token
  	mail(
      to: user.try(:email),
      subject: I18n.t('mailers.service_mailer.verify_password_email.subject')
    )
  end
end
