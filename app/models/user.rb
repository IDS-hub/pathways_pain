class User < ApplicationRecord
  validates :email, :encrypted_password, :salt, presence: true, uniqueness: true

  def match_password(login_password)
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

  def set_password(password)
    new_salt = BCrypt::Engine.generate_salt
    self.assign_attributes(salt: new_salt, encrypted_password: BCrypt::Engine.hash_secret(password, new_salt))
  end
end