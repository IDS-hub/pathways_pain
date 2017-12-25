class Quiz < ApplicationRecord
	include IsDeletedScoping

	belongs_to :session

	validates :question_text, :answer_text, presence: true
	validates :position, position_validate_opts
end
