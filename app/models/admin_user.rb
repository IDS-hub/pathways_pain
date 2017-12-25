class AdminUser < ApplicationRecord
	def to_s
		"#{first_name} #{last_name}".strip
	end

	def password_valid?(pass)
		return false unless salt.present?
		password == hash_password(pass, salt)
	end

	def encrypted_password=(value)
		self.salt = new_salt
		self.assign_attributes(password: hash_password(value, salt))
	end

	def new_salt(hash_class = BCrypt::Engine)
		hash_class.generate_salt
	end

	def hash_password(value, hash_salt = nil, hash_class = BCrypt::Engine)
		hash_salt = self.salt || new_salt
		hash_class.hash_secret(value, salt)
	end
end
