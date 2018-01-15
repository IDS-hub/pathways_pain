class Api::V1::Validate::Show < BaseInteraction
	string :confirmation_token
  object :current_user, class: User, default: nil

	def execute
		payload = ::SecureData.decrypt(confirmation_token)

		if payload[:ends_at] < DateTime.now
			return errors.add(:base, "Confirmation link has been expired")
		else

			user = ::User.unscoped.unconfirmed.find_by(email: payload[:login])

			if user
				user.confirmed_at = DateTime.now
				user.access_token = SecureRandom.hex(6)
				user.save!

				return user
			else
				return errors.add(:base, "User does not exists or has been already confirmed")
			end
		end
	end
end
