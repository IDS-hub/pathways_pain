class ApplicationMailer < ActionMailer::Base
  default from: DATA['email_login']
  layout 'mailer'
end
