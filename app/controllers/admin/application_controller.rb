module Admin
  class ApplicationController < Administrate::ApplicationController
  	before_action :authenticate_admin_user

  	private

  	# todo: add exception, handle exception
  	def authenticate_admin_user
  		if !current_admin_user
  			redirect_to new_sign_in_admin_path, notice: I18n.t("admin_sessions.log_in_before")
  		end
  	end

  	# todo: to service
  	def current_admin_user
			session_auth_token = session[:admin_auth]
  		return unless session_auth_token

  		parsed_token = Base64.decode64(session_auth_token)
  		parsed_token = eval(parsed_token) # string into hash

  		@admin ||= AdminUser.find_by(
  			login: parsed_token[:login],
  			password: parsed_token[:encrypted_password]
  		)
  	end
	end
end
