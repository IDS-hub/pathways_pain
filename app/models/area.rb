class Area < ApplicationRecord
	include IsDeletedScoping

	has_many :pain_areas # has many throuh?

	has_many :sessions

	validates :name, presence: true
end
