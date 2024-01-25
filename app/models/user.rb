class User < ApplicationRecord
  has_many :reservation

  validates :email, presence: true
  validates :password_digest, presence: true
  validates :role, presence: true
end
