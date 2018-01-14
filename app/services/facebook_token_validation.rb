class FacebookTokenValidation
	class << self
		VALIDATION_URI = "https://graph.facebook.com/me?access_token="

		def call(fb_token)
			uri = VALIDATION_URI + fb_token
			call_result        = HttpCallService.call(uri)
			parsed_call_result = JSON.parse(call_result)

			parsed_call_result[:error].present?
		end
	end
end