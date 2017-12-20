class Pain < ApplicationRecord
	has_many :pain_areas

	validate :name, presence: true
end
