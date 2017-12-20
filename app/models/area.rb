class Area < ApplicationRecord
	# has many throuh?
	has_many :pain_areas

	has_many :sessions
end
