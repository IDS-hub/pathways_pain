class Api::V1::Profile::Update < BaseInteraction

  with_options default: nil do
    string :first_name
    string :last_name
    string :email
    string :password
    string :password_confirmation
  end

  validates :password, confirmation: true, length: { within: 6..40 }, allow_blank: true

  def execute
    params_for_update = inputs.compact.except!(:current_user)
    if given?(:password)
      current_user.set_password(password)
      params_for_update.except!(*[:password, :password_confirmation])
    end
    current_user.assign_attributes(params_for_update)
    return errors.add(:base, current_user.errors.full_messages.to_sentence) unless current_user.save
    current_user
  end
end
