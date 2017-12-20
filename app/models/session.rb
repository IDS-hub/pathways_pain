class Session < ApplicationRecord
	include IsDeletedScoping

	belongs_to :user
	belongs_to :session

	enum lang: [:en]

	validates :name, presence: true, length: { maximum: 200 }	
end
