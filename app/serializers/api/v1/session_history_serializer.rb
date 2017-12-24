class Api::V1::SessionHistorySerializer < ActiveModel::Serializer
	type 'session_history'
	attributes :id, :session_id, :pain_level, :created_at, :pain_cause_id
end