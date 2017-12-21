class PainCause < ApplicationRecord
	include IsDeletedScoping

	has_many :sessions
	has_many :user_pain_causes

	validates :name, presence: true
end
