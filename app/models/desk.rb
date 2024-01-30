class Desk < ApplicationRecord
  has_many :reservations
  has_one_attached :photo

  validates :x, presence: true
  validates :y, presence: true
end
