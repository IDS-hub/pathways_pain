require "administrate/base_dashboard"

class SessionDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    pain_cause: Field::BelongsTo,
    session_histories: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    session_text: Field::Text,
    media_link: Field::String,
    position: Field::Number,
    media_duration_sec: Field::Number,
    is_deleted: Field::Boolean
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :pain_cause,
    :session_histories,
    :position,
    :name,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :pain_cause,
    :session_histories,
    :name,
    :session_text,
    :media_link,
    :position,
    :media_duration_sec,
    :is_deleted
  ].freeze

  FORM_ATTRIBUTES = [
    :pain_cause,
    :name,
    :session_text,
    :media_link,
    :position,
    :media_duration_sec,
    :is_deleted
  ].freeze

  def display_resource(session)
    "Session #{session.name}"
  end
end
