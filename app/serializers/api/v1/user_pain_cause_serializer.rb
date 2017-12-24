class Api::V1::UserPainCauseSerializer < ActiveModel::Serializer
	type 'user_pain_cause'
	attributes :name, :id, :user_id, :pain_cause_id
end
