class SignInAdminController < ApplicationController
	def new
	end

	# todo: to interaction or service
	def create
		@admin_user = AdminUser.find_by(login: params[:login])

		if @admin_user && @admin_user.password_valid?(params[:password])
			session_params = {
				login: params[:login], 
				encrypted_password: @admin_user.hash_password(params[:password])
			}

			session[:admin_auth] = Base64.encode64(session_params.to_s)

			flash[:notice] = I18n.t('admin_sessions.login_success')
			redirect_to admin_users_path

		else
			flash[:notice] = I18n.t('admin_sessions.wrong_credentials')
			render :new
		end
	end

	def destroy
		session[:admin_auth] = nil
		render :new
	end
end