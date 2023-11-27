class User < ApplicationRecord
  has_many :reservation

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
