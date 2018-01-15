class Api::V1::AuthProvider::Create < BaseInteraction
  object :current_user, class: User, default: nil
  string :login
  string :first_name, default: nil 
  string :last_name, default: nil

  hash :provider_info do
    string :provider_name
    string :provider_token
  end

  validates :login, presence: true
  validates :first_name, :last_name, length: { maximum: 200 }
  validates :login, presence: true

  validate :validate_provider_data_presence

  def execute
    begin
      send("sign_up_#{provider_info[:provider_name]}")
    # rescue NoMethodError
    #   errors.add(:base, I18n.t(
    #     'interactions.registrations.wrong_provider',
    #     provider_name: provider_info[:provider_name]
    #     )
    #   )
    end
  end

  private

  def sign_up_facebook
    if provider_token_valid?
      update_logging_user!
      update_user_provider!

      logging_user

    else
      errors.add(:base, I18n.t(
          'interactions.registrations.invalid_provider_token',
          provider_name: provider_info[:provider_name]
        )
      )
    end
  end

  private

  def provider_token_valid?(validate_service = FacebookTokenValidation)
    is_fb_token_valid = false
    user_provider_data = logging_user.auth_provider_data('facebook')

    if user_provider_data.present? &&
      user_provider_data.provider_access_token == provider_info[:provider_token]
      # if provider present data present check in db first
      is_fb_token_valid = true

    else
      if ::UsersAuthProvider.where(provider_access_token: provider_info[:provider_token]).present?
        is_fb_token_valid = false
      else
        is_fb_token_valid = validate_service.call(provider_info[:provider_token])    
      end
    end

    is_fb_token_valid
  end

  def update_user_provider!
    fb_provider   = ::AuthProvider.find_by(name: 'facebook')
    user_provider = ::UsersAuthProvider.find_or_create_by(
      user_id: logging_user.id,
      auth_provider_id: fb_provider.id
    )
    user_provider.update(provider_access_token: provider_info[:provider_token])
  end

  def update_logging_user(user = logging_user)
    user.first_name = first_name if first_name.present?
    user.last_name  = last_name if last_name.present?

    user.confirmed_at = DateTime.now if !user.confirmed_at.present?
    user.access_token = SecureRandom.hex(6) # todo: token service
  end

  def update_logging_user!(user = logging_user)
    update_logging_user(user)
    user.save!
  end

  def logging_user
    @loggin_user ||= ::User.find_or_create_by(email: login) # handle email absence
  end

  def validate_provider_data_presence
    if !provider_info[:provider_name] && !provider_info[:provider_token]
      errors.add(:base,
        I18n.t(
          "registrations.wrong_provider_credentials",
          parameters: "provider_name and provider_token"
        )
      )
    end
  end
end
