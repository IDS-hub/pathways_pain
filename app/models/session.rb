class Session < ApplicationRecord
	include IsDeletedScoping

	belongs_to :pain_cause
	has_many :session_histories

	enum lang: [:en]

	validates :name, presence: true, length: { maximum: 200 }
	validates :position, position_validate_opts

	def self.feel_good(user_id)
		includes(:session_histories)
		.where(
			session_histories: {
				pain_level: 0..1, # todo: to .settings singleton table
				user_id: user_id
			}
		)
	end
end
