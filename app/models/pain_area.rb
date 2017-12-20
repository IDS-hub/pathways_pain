class PainArea < ApplicationRecord
	belongs_to :pain
	belongs_to :area
	belongs_to :user

	validates :pain_level, numericality: { 
  	less_than_or_equal_to: 10,
  	greater_than_or_equal_to: 0,
  	only_integer: true
  }
end
