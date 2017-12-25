require "administrate/base_dashboard"

class PainCauseDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    is_deleted: Field::Boolean,
    sessions: Field::HasMany
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :sessions,
    :is_deleted,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :sessions,
    :name,
    :is_deleted,
  ].freeze

  FORM_ATTRIBUTES = [
    :name,
    :is_deleted,
  ].freeze

  def display_resource(pain_cause)
    "#{pain_cause.name.capitalize}"
  end
end
