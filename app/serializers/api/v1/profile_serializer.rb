class Api::V1::ProfileSerializer < ActiveModel::Serializer
  attributes :id,
  :first_name,
  :last_name,
  :email,
  :access_token,
  :reset_password_token
end
