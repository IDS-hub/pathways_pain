require 'rails_helper'

RSpec.describe User, type: :model do
	let(:new_user) { build :user }

	let(:example_password) { Faker::Internet.password }
	let(:another_password) { Faker::Internet.password }

	context '#set_password' do
		it 'set a new #salt' do
			expect(new_user.salt).to be_blank

			new_user.set_password(example_password)

			expect(new_user.salt).not_to be_blank
		end

		it 'set #encrypted_password' do
			expect(new_user.encrypted_password).to be_blank

			new_user.set_password(example_password)

			expect(new_user.encrypted_password).not_to be_blank
			expect(new_user.encrypted_password).not_to eq example_password
		end

		it 'has an alias #password=' do
			expect(new_user.encrypted_password).to be_blank

			new_user.password = example_password

			expect(new_user.salt).not_to be_blank
			expect(new_user.encrypted_password).not_to be_blank
			expect(new_user.encrypted_password).not_to eq example_password # it hashed
		end
	end

	context '#password_valid?' do
		context 'false if' do
			it 'not #salt' do
				expect(new_user.salt).to be_blank
				expect(new_user.password_valid?(another_password)).to be_falsey
			end

			it '#encrypted_password and arg not equal' do
				new_user.set_password(example_password)

				expect(new_user.password_valid?(another_password)).to be_falsey
			end
		end


		context 'true if' do
			it '#encrypted_password and hashed arg are equal' do
				new_user.set_password(example_password)

				expect(new_user.password_valid?(example_password)).to be_truthy
			end
		end
	end
end