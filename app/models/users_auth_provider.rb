class UsersAuthProvider < ApplicationRecord
	belongs_to :user
	belongs_to :auth_provider

	validates :provider_access_token,
		uniqueness: true,
		presence: true

	# validate :provider_access_token_valid?

	validates :user, uniqueness: { scope: :auth_provider }

	def token_valid?(token = provider_access_token)
		klass = "#{auth_provider.name}TokenValidation".camelize.constantize
		klass.call(token)
	end

	private

	def provider_access_token_valid?
		errors.add(
			I18n.t 'activerecord.users_auth_providers.invalid_token'
			) unless provider_token_valid?
	end
end
