class Session < ApplicationRecord
	include IsDeletedScoping

	belongs_to :user
	belongs_to :session_list

	enum lang: [:en]

	validates :name, presence: true, length: { maximum: 200 }	
end
