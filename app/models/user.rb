class User < ApplicationRecord
  attr_accessor :password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, length: { within: 6..40 }, on: :create
  validates :password, confirmation: true, length: { within: 6..40 }, allow_blank: true, on: :update
end