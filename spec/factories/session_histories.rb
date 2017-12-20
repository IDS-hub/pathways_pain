FactoryBot.define do
  factory :session_history do
    user
    session
    is_completed false
  end
end
