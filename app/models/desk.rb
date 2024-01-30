class Desk < ApplicationRecord
  has_many :reservations
  has_one_attached :photo
  def available?(date)
    reservations.where('start_date <= ? AND end_date >= ?', date, date).empty?
  end
end
