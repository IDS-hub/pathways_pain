class Quiz < ApplicationRecord
	include IsDeletedScoping

	belongs_to :session

	validates :question_text, :answer_text, :position, :session,
		presence: true

	validate :position_is_unique, if: -> { session.present? && position.present? }

	private

	def position_is_unique
		is_present = Quiz
			.includes(:session)
			.where.not(id: self.id)
			.where(
				sessions: { id: session_id },
				position: position,
				is_deleted: false
			).present?

		if is_present
			errors.add(:base,
				I18n.t(
					"activerecord.errors.quiz.position_not_unique",
					position: position,
					session_name: session.name.downcase
				)
			)
		end
	end
end
