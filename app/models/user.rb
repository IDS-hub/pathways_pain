class User < ApplicationRecord
  validates :email, :encrypted_password, :salt,
    presence: true,
    uniqueness: true

  alias_attribute :password=, :set_password

  def to_s
    "#{first_name} #{last_name}".strip
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
