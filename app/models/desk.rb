class Desk < ApplicationRecord
  has_many :reservations

  validates :x, presence: true
  validates :y, presence: true
end
