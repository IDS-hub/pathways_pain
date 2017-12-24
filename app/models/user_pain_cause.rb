class UserPainCause < ApplicationRecord
	include IsDeletedScoping

	belongs_to :pain_cause
	belongs_to :user

	delegate :name, to: :pain_cause

	validates :pain_level, numericality: pain_level_validate_opts

	validate :user_already_has_pain_cause

	private

	def user_already_has_pain_cause
		is_pain_cause_invalid =
			UserPainCause.any? do |cause|
				cause.user_id == self.user_id &&
				cause.pain_cause_id == self.pain_cause_id &&
				cause.id != self.id
			end

		if is_pain_cause_invalid
			errors.add(
				:base,
				I18n.t(
					'activerecord.errors.user_pain_cause.user_present',
					user_id: self.user_id,
					pain_cause_id: self.pain_cause_id
					)
			)
		end
	end
end
