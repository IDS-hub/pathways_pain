class UserAuthProviderSerializer < ActiveModel:Serializer
	attributes :provider_name, :provider_access_token
end