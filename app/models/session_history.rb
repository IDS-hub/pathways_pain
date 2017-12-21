class SessionHistory < ApplicationRecord
  belongs_to :user
  belongs_to :session

  validates :pain_level, numericality: { 
  	less_than_or_equal_to: 10,
  	greater_than_or_equal_to: 0,
  	only_integer: true
  }
end
