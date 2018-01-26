class Api::V1::Profile::Create < BaseInteraction
  EMAIL_REGEX = /\A.+@.+$\z/
  DAYS_TOKEN_VALID = 1

  object :current_user, class: User, default: nil
  string :first_name, default: ''
  string :last_name, default: ''
  string :email
  string :password
  string :password_confirmation
  boolean :is_skip_verify, default: true

  validates :password, confirmation: true, length: { within: 6..40 }
  validates :email, format: EMAIL_REGEX

  def execute
    new_user = User.new(inputs.except(*[:current_user, :password, :password_confirmation, :is_skip_verify]))
    new_user.set_password(password)

    if !new_user.save
      return errors.add(:base, new_user.errors.full_messages.to_sentence)
    end

    if is_skip_verify
      new_user.update(confirmed_at: DateTime.now)
      return new_user
    else
      payload = {
        login: new_user.email,
        ends_at: DateTime.now + DAYS_TOKEN_VALID
      }

      reset_password_link = SecureData.encrypt(payload)
      ServiceMailer.verify_password_email(new_user, reset_password_link).deliver_later
      return
    end
  end
end
