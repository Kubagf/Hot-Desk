class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :desk

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validate :desk_available?, on: :create
  validate :update_desk_available?, on: :update

  def end_date_after_start_date
    if start_date && end_date && start_date >= end_date
      errors.add(:end_date, "must be after the start date")
    end
  end


  def desk_available?
    if desk.reservations.where('start_date < ? AND end_date > ?', end_date, start_date).exists?
      errors.add(:base, 'Desk is already reserved for this time')
    end
  end

  def update_desk_available?
    if desk.reservations.where.not(id: self.id).where('start_date <= ? AND end_date >= ?', start_date, end_date).exists?
      errors.add(:base, 'Desk is already reserved for this date')
    end
  end
end
