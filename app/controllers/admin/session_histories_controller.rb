module Admin
  class SessionHistoriesController < Admin::ApplicationController
    # removed #destroy, #new and #edit actions -
    # session history is the history, no modifications here
    def valid_action?(name, resource = resource_class)
      %w[destroy edit new].exclude?(name.to_s) && super
    end
  end
end
