class Api::V1::Profile::Update < BaseInteraction
  string :first_name, default: nil
  string :last_name, default: nil
  string :email, default: nil
  string :password, default: nil
  string :password_confirmation, default: nil

  validate do
    if given?(:password)
      errors.add(:base, 'password can not be blank') if password.empty?
      errors.add(:base, 'password did not match with password confirmation') if password != password_confirmation
    end
    errors.add(:base, 'email can not be blank') if given?(:email) && email.empty?
  end

  def execute
    params_for_update = inputs.compact.except!(:current_user)
    if given?(:password)
      salt = BCrypt::Engine.generate_salt
      current_user.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
      params_for_update.except!(*[:password, :password_confirmation])
    end
    current_user.assign_attributes(params_for_update)
    return errors.add(:base, current_user.errors.full_messages.to_sentence) unless current_user.save
    current_user
  end
end
