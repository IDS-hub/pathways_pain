class Api::V1::QuizSerializer < ActiveModel::Serializer
	type 'quiz'

	attributes :id,
		:question_text,
		:answer_text,
		:answer_bool,
		:position
end