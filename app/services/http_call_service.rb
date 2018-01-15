require 'net/http'

class HttpCallService
	class << self
		def call(uri_string, method: :get)
			begin
				send("#{method}_call", uri_string)
			rescue NoMethodError
				nil
			end
		end

		private

		def get_call(uri_string)
			# uri string sh be with query params if present
			uri = URI(uri_string)

			http = Net::HTTP.new(uri.host, uri.port)  
			http.use_ssl = true
		  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

			req = Net::HTTP::Get.new(uri)

			http.request(req) 
		end
	end
end
