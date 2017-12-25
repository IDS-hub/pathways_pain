module Admin
  class PainCausesController < Admin::ApplicationController
    # removed #destroy action - we have #is_deleted attribute for that
    def valid_action?(name, resource = resource_class)
      %w[destroy].exclude?(name.to_s) && super
    end
  end
end
