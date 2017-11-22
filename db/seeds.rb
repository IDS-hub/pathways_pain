User.destroy_all

User.create(email: 'profile@test.com', first_name: 'First', last_name: 'Last', access_token: 'accesstoken')