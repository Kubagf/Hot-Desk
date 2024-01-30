class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :desk

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :desk_available?
    def desk_available?
      if desk.reservations.where('start_date < ? AND end_date > ?', end_date, start_date).exists?
        errors.add(:base, 'Desk is already reserved for this time')
      end
    end
end
