class PainCause < ApplicationRecord
	include IsDeletedScoping

	has_many :session_lists, dependent: :destroy

	validates :name, presence: true
end
