class UserPainCause < ApplicationRecord
	include IsDeletedScoping

	belongs_to :pain_cause
	belongs_to :user

	validates :pain_level, numericality: pain_level_validate_opts
end
