class PainCause < ApplicationRecord
	include IsDeletedScoping

	has_many :sessions, dependent: :destroy

	validates :name, presence: true
end
