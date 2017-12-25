class Session < ApplicationRecord
	include IsDeletedScoping

	belongs_to :pain_cause
	has_many :session_histories

	enum lang: [:en]

	validates :name, presence: true, length: { maximum: 200 }
	validates :media_duration_sec, numericality: {
		greater_than: 0,
		less_than_or_equal_to: 3600
	}

	validates :position, presence: true
	validate :position_is_unique, if: -> { position.present? }

	def self.feel_good(user_id)
		includes(:session_histories)
		.where(
			session_histories: {
				pain_level: 0..1, # todo: to .settings singleton table
				user_id: user_id
			}
		)
	end

	private

	def position_is_unique
		is_present = Session.includes(:pain_cause)
			.where.not(id: self.id)
			.where(
				pain_causes: {
					id: pain_cause_id
				},
				position: position,
				is_deleted: false
			).present?

		if is_present
			errors.add(:base,
				I18n.t(
					'activerecord.errors.session.position_not_unique',
					position: position,
					pain_cause_name: self.pain_cause.name.downcase
				)
			)
		end
	end
end
