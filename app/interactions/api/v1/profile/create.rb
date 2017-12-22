class Api::V1::Profile::Create < BaseInteraction
  object :current_user, class: User, default: nil
  string :first_name, default: ''
  string :last_name, default: ''
  string :email
  string :password
  string :password_confirmation

  validates :password, confirmation: true, length: { within: 6..40 }

  def execute
    new_user = User.new(inputs.except(*[:current_user, :password, :password_confirmation]))
    new_user.set_password(password)
    return errors.add(:base, new_user.errors.full_messages.to_sentence) unless new_user.save
    new_user
  end
end
