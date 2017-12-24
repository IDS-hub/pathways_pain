class Api::V1::SessionHistoryChartSerializer < ActiveModel::Serializer
	type 'session_history_chart'

	attributes :id, :pain_level, :created_at
end