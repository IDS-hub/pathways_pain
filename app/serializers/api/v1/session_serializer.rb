class Api::V1::SessionSerializer < ActiveModel::Serializer
	attributes :id,
		:name,
		:session_text,
		:position,
		:media_duration_sec,
		:media_link,
		:pain_cause_id
end