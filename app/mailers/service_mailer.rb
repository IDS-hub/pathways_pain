class ServiceMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def reset_password_email(user)
    @url  = api_v1_password_url(reset_password_token: user.try(:reset_password_token))
    mail(to: user.try(:email), subject: 'You have requested password restore!')
  end
end
