class Api::V1::UserAuthProviderSerializer < ActiveModel::Serializer
	attributes :id, :provider_name, :provider_access_token
end