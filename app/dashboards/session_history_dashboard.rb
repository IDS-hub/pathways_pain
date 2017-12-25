require "administrate/base_dashboard"

class SessionHistoryDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    user: Field::BelongsTo,
    session: Field::BelongsTo,
    is_completed: Field::Boolean,
    created_at: Field::DateTime,
    pain_level: Field::Number,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :user,
    :session
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :user,
    :session,
    :created_at,
    :pain_level,
  ].freeze

  FORM_ATTRIBUTES = [
    :user,
    :session,
    :pain_level,
  ].freeze

  def display_resource(session_history)
    "Session history #{session_history.id} (#{session_history.user.to_s})"
  end
end
