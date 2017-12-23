class  Api::V1::UserPainCausesController < Api::V1::ApplicationController
	def index
		render_response(
			Api::V1::UserPainCauses::Index,
			{},
			{ serializer: Api::V1::UserPainCausesSerializer }
		)
	end

	def show
		render_response(
			Api::V1::UserPainCauses::Show,
			user_pain_cause_params,
			{ serializer: Api::V1::UserPainCausesSerializer }
		)
	end

	def update
		change_resource(
			Api::V1::UserPainCause::Update,
			Api::V1::UserPainCauseSerializer,
			user_pain_cause_params
		)
	end

	def create
		change_resource(
			Api::V1::UserPainCause::Create,
			Api::V1::UserPainCauseSerializer,
			user_pain_cause_params
		)
	end

	def destroy
		change_resource(
			Api::V1::UserPainCause::Destroy,
			Api::V1::UserPainCauseSerializer,
			user_pain_cause_params
		)
	end

	private

	def user_pain_cause_params
		params.permit(:id, :pain_causes_id, :pain_level)
	end
end
