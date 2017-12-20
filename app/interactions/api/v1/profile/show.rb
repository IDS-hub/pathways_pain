class Api::V1::Profile::Show < BaseInteraction
  validate do
    errors.add(:base, I18n.t('interactions.profile.general_error')) unless current_user.present?
  end

  def execute
    current_user
  end
end
