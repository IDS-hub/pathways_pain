class PainArea < ApplicationRecord
	belongs_to :pain
	belongs_to :area
	belongs_to :user
end
