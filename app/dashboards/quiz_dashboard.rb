require "administrate/base_dashboard"

class QuizDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    question_text: Field::String,
    answer_text: Field::String,
    answer_bool: Field::Boolean,
    position: Field::Number,
    is_deleted: Field::Boolean,

    session: Field::BelongsTo
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :id,
    :session,
    :position,
    :is_deleted
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :session,
    :position,

    :question_text,
    :answer_text,
    :answer_bool,

    :is_deleted
  ].freeze

  FORM_ATTRIBUTES = [
    :session,
    :position,
    :question_text,
    :answer_text,
    :answer_bool,
    :is_deleted
  ].freeze

  def display_resource(quiz)
    session = quiz.session
    "Quiz ##{quiz.id} (session ##{session.id}, #{session.name.downcase})"
  end
end
