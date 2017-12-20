class Pain < ApplicationRecord
	include IsDeletedScoping

	has_many :pain_areas

	validates :name, presence: true
end
