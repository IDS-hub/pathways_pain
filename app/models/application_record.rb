class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  default_scope where(is_deleted: false)

  scope :deleted, -> { where(is_deleted: true) }
end
