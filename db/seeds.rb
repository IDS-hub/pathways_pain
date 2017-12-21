User.destroy_all
PainCause.destroy_all
SessionList.destroy_all

u = User.new(email: 'profile@test.com', first_name: 'First', last_name: 'Last')
u.password     = "123123"
u.access_token = "acesstoken"
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

3.times { SessionList.create(pain_cause: PainCause.first, name: Faker::Hipster.word) }

