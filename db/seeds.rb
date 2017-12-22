User.destroy_all
PainCause.destroy_all

u = User.new(email: 'profile@test.com', first_name: 'First', last_name: 'Last')
u.password     = "123123"
u.access_token = "accesstoken"
u.save

pain_condition_names = [
	"Arteriosclerosis",
	"Arthritis" ,
	"Back Pain",
	"Cancer",
	"Carpal Tunnel",
	"Chronic Fatigue Syndrome",
	"Cluster Headaches",
	"Coccydynia",
	"CRPS",
	"Digestive Issues",
	"Fibromyalgia",
	"Frozen Shoulder",
	"Golfers Elbow",
	"Gout",
	"Hypertension",
	"Irritable Bowel Syndrome",
	"Knee Pain",
	"Lower Back & Leg Pain",
	"Lower Back Pain",
	"Lyme Disease",
	"Migraine",
	"Myofascial Pain Syndrome",
	"Nerve Pain",
	"Osteoporosis",
	"Pinched Nerve",
	"Post-Polio Syndrome",
	"Reflex Sympathetic Dystrophy",
	"Repetitive Strain Injury (RSI)",
	"Sciatica",
	"Shin Splints",
	"Shingles",
	"Temperomandibular Pain Syndrome",
	"Tendonitis",
	"Tennis Elbow",
	"Tension Myalgia",
	"Thoracic Outlet Syndrome",
	"Tinnitus"
]

pain_condition_names.each do |cond_name|
	PainCause.create(name: cond_name)
end

UserPainCause.create(user: u, pain_cause: PainCause.first)
3.times { Session.create(name: Faker::Hipster.word, pain_cause: PainCause.first) }

Session.find_each do |session|
	sess_h = SessionHistory.new
	sess_h.user_id = u.id
	sess_h.pain_level = Random.rand(10)
	sess_h.session_id = session.id
	sess_h.save
end



