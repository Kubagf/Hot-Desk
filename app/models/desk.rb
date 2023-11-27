class Desk < ApplicationRecord
  has_many :reservation

  validates :x, presence: true
  validates :y, presence: true
end
