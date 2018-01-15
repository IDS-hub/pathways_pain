class FacebookTokenValidation
	class << self
		VALIDATION_URI = "https://graph.facebook.com/me?access_token="

		def call(fb_token)
			url = VALIDATION_URI + fb_token
	
			call_result = HttpCallService.call(url)
			call_result.kind_of? Net::HTTPSuccess
		end
	end
end
