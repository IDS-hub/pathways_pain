class FacebookTokenValidation
	class << self
		VALIDATION_URI = "https://graph.facebook.com/me?access_token="
		TEST_TOKEN = "EAAChoca8ZBW0BAIQKijwcDKxIPbPZAEzEzvW5WDHEwv1TsfMhdYjWshKNhZBRCr9Xolw4AJJ4j89wYUcxI9bRNHRY5GjNUkSMZBRbLnzHBtbRC4hs7iBjZCDCs1uEoDFvlS6D5s7imt3qeFZCvrDBhcGzBzwKjpwKnAGcUK5QkN1c59SdhdjCZAKKxH5VOn1TQZD"

		def call(fb_token)
			url = VALIDATION_URI + fb_token
	
			call_result = HttpCallService.call(url)
			call_result.kind_of? Net::HTTPSuccess
		end
	end
end
