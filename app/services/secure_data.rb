class SecureData
	class << self
		def encrypt(data)
			key = get_key(salt)
			crypt_instance = crypt(key)
			crypt_instance.encrypt_and_sign(data)
		end

		def decrypt(encrypted_data)
			key = get_key(salt)
			crypt_instance = crypt(key)
			crypt_instance.decrypt_and_verify(encrypted_data)
		end

		private

		def salt
			# Rails.application.secrets.salt
			DATA["salt"] # temp, for stagign only
		end

		def secret
			# Rails.application.secrets.peper
			DATA["peper"] # temp, for staging
		end

		def get_key(salt)
			ActiveSupport::KeyGenerator.new(secret).generate_key(salt, 32)
		end

		def crypt(key)
			ActiveSupport::MessageEncryptor.new(key)
		end
	end
end
