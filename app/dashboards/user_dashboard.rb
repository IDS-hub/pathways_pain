require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    email: Field::String,
    created_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :first_name,
    :last_name,
    :email,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :first_name,
    :last_name,
    :email,
    :created_at,
  ].freeze

  FORM_ATTRIBUTES = [
    :first_name,
    :last_name,
    :email,
  ].freeze

  def display_resource(user)
    "#{user.to_s} (#{user.email})"
  end
end
