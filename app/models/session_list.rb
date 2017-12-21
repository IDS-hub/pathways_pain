class SessionList < ApplicationRecord
	belongs_to :pain_cause
	has_many :sessions

	validates :name, presence: true
end
