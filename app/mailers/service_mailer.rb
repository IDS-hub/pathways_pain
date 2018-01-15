class ServiceMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def reset_password_email(user)
    @url  = api_v1_password_url(reset_password_token: user.try(:reset_password_token))
    mail(to: user.try(:email), subject: 'You have requested password restore!')
  end

  def verify_password_email(user, verify_token)
  	client_point = Rails.application.secrets.client_verification_point
  	@url = client_point + verify_token
  	mail(to: user.try(:email), subject: "Please confirm registration on pathways")
  end
end
