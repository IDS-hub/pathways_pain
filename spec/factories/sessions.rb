FactoryBot.define do
  factory :session do
		name { Faker::Hipster.word}
		session_text { Faker::Lorem.sentence }
		media_link { Faker::Internet.url }

		area
  end
end
