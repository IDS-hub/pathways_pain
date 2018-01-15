class User < ApplicationRecord
  validates :email, # :encrypted_password, :salt,
    presence: true,
    uniqueness: true

  has_many :users_auth_providers
  has_many :auth_providers, through: :users_auth_providers

  alias_attribute :password=, :set_password

  def to_s
    "#{first_name} #{last_name}".strip
  end

  # todo: handle email:
  # 1. rename email to login
  #  > deal with "reset password" > enter email with no check in database
  # or
  # 2. add phone field:
  # > login for email or phone; validate present phone or email 

  def confirmed?
    confirmed_at.present?
  end

  def auth_provider_valid?(provider_name = 'facebook')
    return false unless auth_providers &&
      auth_providers.map(&:name).include?(provider_name)

      auth_provider_data(provider_name).token_valid?
  end

  def auth_providers_names
    auth_providers&.map(&:name)
  end

  def auth_provider_data(provider_name = 'facebook')
    users_auth_providers
      .includes(:auth_provider)
      .where(auth_providers: { name: provider_name })
      &.first
  end

  def password_valid?(login_password)
  	return false unless salt.present?
    encrypted_password == hash_password(login_password, salt)
  end

  def set_password(password)
		self.salt = new_salt
  	self.assign_attributes(encrypted_password: hash_password(password, salt))
  end

  private

  def new_salt(hash_class = BCrypt::Engine)
  	hash_class.generate_salt
  end

  def hash_password(login_password, salt, hash_class = BCrypt::Engine)
  	hash_class.hash_secret(login_password, salt)
  end
end
