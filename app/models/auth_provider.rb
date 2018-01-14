class AuthProvider < ApplicationRecord
	has_many :users, through: :auth_providers

	validates :name,
		uniqueness: true,
		presence: true,
		length: { maximum: 20 }
end