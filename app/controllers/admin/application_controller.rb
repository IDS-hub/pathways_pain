module Admin
  class ApplicationController < Administrate::ApplicationController
  	http_basic_authenticate_with(
    	name: ENV["admin_email"],
    	password: ENV["admin_password"]
  	)
	end
end
