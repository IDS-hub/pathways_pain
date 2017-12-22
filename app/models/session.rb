class Session < ApplicationRecord
	include IsDeletedScoping

	belongs_to :pain_causes
	has_many :session_histories

	enum lang: [:en]

	validates :name, presence: true, length: { maximum: 200 }

	def self.feel_good(user)
		includes(:session_histories)
		.where(
			session_histories: {
				pain_level: 0..1,
				user_id: user.id
			}
		)
	end
end
