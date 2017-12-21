class SessionList < ApplicationRecord
	belongs_to :pain_causes
	has_many :sessions

	validates :name, presence: true
end
