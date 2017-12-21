module IsDeletedScoping
	extend ActiveSupport::Concern

	included do
		default_scope { where(is_deleted: false) }
  	scope :deleted, -> { where(is_deleted: true) }
	end
end
