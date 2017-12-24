class SessionHistory < ApplicationRecord
  belongs_to :user
  belongs_to :session

  validates :pain_level, numericality: pain_level_validate_opts
  validates :user, :session, presence: true

  delegate :pain_cause_id, to: :session
end
